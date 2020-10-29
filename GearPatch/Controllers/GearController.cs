using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
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

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var gear = _gearRepository.GetActiveGearById(id);
            if (gear == null)
            {
                return NotFound();
            }

            return Ok(gear);
        }

        [HttpGet("more/{id}")]
        public IActionResult GetMore(int id)
        {
            return Ok(_gearRepository.GetThreeRandomByUser(id));
        }

        //[Authorize]
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

        private UserProfile GetCurrentUserProfile()
        {
            var firebaseId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userProfileRepository.GetByFirebaseId(firebaseId);
        }
    }
}

