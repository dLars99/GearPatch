using System;
using System.Security.Claims;
using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
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
        public GearController(IGearRepository gearRepository,
                              IUserProfileRepository userProfileRepository,
                              IAccessoryRepository accessoryRepository)
        {
            _gearRepository = gearRepository;
            _userProfileRepository = userProfileRepository;
            _accessoryRepository = accessoryRepository;
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
            if (gear.IsActive == false)
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

        [HttpPut("{id}")]
        public IActionResult Put(int id, Gear gear)
        {
            if (id != gear.Id)
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

        private UserProfile GetCurrentUserProfile()
        {
                var firebaseUser = User.FindFirst(ClaimTypes.NameIdentifier);
                return (firebaseUser == null) ? null : _userProfileRepository.GetByFirebaseId(firebaseUser.Value);
        }
    }
}

