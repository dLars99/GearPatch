using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
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

        [HttpPut("{id}")]
        public IActionResult Put(int id, UserProfile userProfile)
        {
            // The client does not have access to the FirebaseId, so we need the full existing object
            var existingUserProfile = _userProfileRepository.GetById(id);
            if (existingUserProfile.Id != userProfile.Id || id != userProfile.Id)
            {
                return Unauthorized();
            }

            userProfile.FirebaseId = existingUserProfile.FirebaseId;
            userProfile.IsActive = existingUserProfile.IsActive;

            _userProfileRepository.Update(userProfile);

            return NoContent();
        }
    }
}
