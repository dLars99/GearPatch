using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GearPatch.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserProfileController : ControllerBase
    {
        private readonly IUserProfileRepository _userProfileRepository;
        public UserProfileController(IUserProfileRepository userProfileRepository)
        {
            _userProfileRepository = userProfileRepository;
        }

        [HttpGet("{firebaseUserId}")]
        public IActionResult GetByFirebaseUserId(string firebaseUserId)
        {
            var userProfile = _userProfileRepository.GetByFirebaseId(firebaseUserId);
            if (userProfile == null)
            {
                return NotFound();
            }
            return Ok(userProfile);
        }

        [HttpGet("{userProfileid:int}")]
        public IActionResult Get(int userProfileId)
        {
            var userProfile = _userProfileRepository.GetById(userProfileId);
            if (userProfile == null)
            {
                return NotFound();
            }
            return Ok(userProfile);
        }

        [HttpPost]
        public IActionResult Register(UserProfile userProfile)
        {
            _userProfileRepository.Add(userProfile);
            return CreatedAtAction(
                nameof(GetByFirebaseUserId), new { firebaseUserId = userProfile.FirebaseId }, userProfile);
        }

    }
}
