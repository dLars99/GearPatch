using System;
using System.IO;
using System.Security.Claims;
using System.Threading.Tasks;
using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GearPatch.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GearController : ControllerBase
    {
        private readonly IGearRepository _gearRepository;
        private readonly IUserProfileRepository _userProfileRepository;
        private readonly IAccessoryRepository _accessoryRepository;
        private readonly IReservationRepository _reservationRepository;
        private readonly IWebHostEnvironment _environment;

        public GearController(IGearRepository gearRepository,
                              IUserProfileRepository userProfileRepository,
                              IAccessoryRepository accessoryRepository,
                              IReservationRepository reserverationRepository,
                              IWebHostEnvironment environment)
        {
            _gearRepository = gearRepository;
            _userProfileRepository = userProfileRepository;
            _accessoryRepository = accessoryRepository;
            _reservationRepository = reserverationRepository;
            _environment = environment;
        }

        [HttpGet("search")]
        public IActionResult Search(string q)
        {
            return Ok(_gearRepository.GetSearchResults(q));
        }

        [HttpGet("mine")]

        public IActionResult GetMine()
        {
            var currentUser = GetCurrentUserProfile();
            return Ok(_gearRepository.GetMine(currentUser.Id));
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var gear = _gearRepository.GetById(id);
            if (gear == null)
            {
                return NotFound();
            }
            // Only the owner can access gear that is inactive, or that belongs to an inactive owner
            if (!gear.IsActive || !gear.UserProfile.IsActive)
            {
                try
                {
                    var currentUser = GetCurrentUserProfile();
                    if (currentUser == null || gear.UserProfileId != currentUser.Id)
                    {
                        return NotFound();
                    }
                }
                catch
                {
                    return NotFound();
                }
            }

            return Ok(gear);

        }

        [HttpGet("more/{id}")]
        public IActionResult GetMore(int id)
        {
            return Ok(_gearRepository.GetThreeRandomByUser(id));
        }

        [Authorize]
        [HttpPost]
        public IActionResult Post(Gear gear)
        {
            var currentUser = GetCurrentUserProfile();
            gear.UserProfileId = currentUser.Id;

            try
            {
                _gearRepository.Add(gear);
                foreach (Accessory accessory in gear.Accessories)
                {
                    accessory.GearId = gear.Id;
                    _accessoryRepository.Add(accessory);
                }

                return CreatedAtAction("Get", new { id = gear.Id }, gear);
            }
            catch
            {
                return StatusCode(500);
            }
        }

        [Authorize]
        [HttpPost("file")]
        public async Task<IActionResult> Post(IFormFile formFile)
        {
            var saveFile = Path.Combine(_environment.ContentRootPath, "client", "public", "gear-images", formFile.FileName);
            if (formFile.Length > 0 && formFile.Length < 2097152)
            {
                using (var stream = new FileStream(saveFile, FileMode.Create))

                {
                    await formFile.CopyToAsync(stream);
                }
            }
            else
            {
                return StatusCode(413); 
            }
            return StatusCode(201);
        }

        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, Gear gear)
        {
            // Id 1 is the unmodifiable 'dummy' gear to keep old reservations in the database
            if (id != gear.Id || id == 1)
            {
                return BadRequest();
            }

            var currentUser = GetCurrentUserProfile();
            if (currentUser.Id != gear.UserProfileId)
            {
                return Unauthorized();
            }

            _gearRepository.Update(gear);
            foreach (Accessory accessory in gear.Accessories)
            {
                if (accessory.GearId != gear.Id)
                {
                    return BadRequest();
                }
                _accessoryRepository.Update(accessory);
            }

            return NoContent();
        }
        [Authorize]
        [HttpPut("activate/{id}")]
        public IActionResult Put(int id)
        {
            // Id 1 is the permanently inactive 'dummy' gear to keep old reservations in the database
            if (id == 1)
            {
                return BadRequest();
            }

            var gear = _gearRepository.GetById(id);
            var currentUser = GetCurrentUserProfile();

            if (currentUser.Id != gear.UserProfileId)
            {
                return Unauthorized();
            }

            gear.IsActive = !gear.IsActive;
            _gearRepository.Update(gear);

            return NoContent();
        }

        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            // Id 1 is the permanent 'dummy' gear to keep old reservations in the database
            if (id == 1)
            {
                return BadRequest();
            }
            var reservations = _reservationRepository.GetByGear(id);
            foreach(Reservation reservation in reservations)
            {
                // Set to reserved, "unavailable" gear
                reservation.GearId = 1;
                _reservationRepository.Update(reservation);
            }

            _gearRepository.Delete(id);

            return NoContent();     
        }

        private UserProfile GetCurrentUserProfile()
        {
                var firebaseUser = User.FindFirst(ClaimTypes.NameIdentifier);
                return (firebaseUser == null) ? null : _userProfileRepository.GetByFirebaseId(firebaseUser.Value);
        }
    }
}

