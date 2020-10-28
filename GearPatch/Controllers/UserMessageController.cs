using System;
using System.Security.Claims;
using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GearPatch.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserMessageController : ControllerBase
    {
        private readonly IUserMessageRepository _userMessageRepository;
        private readonly IUserProfileRepository _userProfileRepository;

        public UserMessageController(IUserMessageRepository userMessageRepository,
                                    IUserProfileRepository userProfileRepository)
        {
            _userMessageRepository = userMessageRepository;
            _userProfileRepository = userProfileRepository;
        }

        [HttpGet("conversation")]
        public IActionResult GetConversations()
        {
            //var currentUser = GetCurrentUserProfile();

            return Ok(_userMessageRepository.GetConversationsByUser(1));
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var message = _userMessageRepository.GetById(id);
            if (message == null)
            {
                return NotFound();
            }

            return Ok(message);
        }

        [HttpGet("new")]
        public IActionResult GetNewMessageCount()
        {
            var currentUser = GetCurrentUserProfile();
            int messageCount = _userMessageRepository.NewMessageCount(currentUser.Id);
            return Ok(messageCount);
        }

        [HttpPost]
        public IActionResult Post(UserMessage message)
        {
            var currentUser = GetCurrentUserProfile();
            message.SenderId = currentUser.Id;
            message.CreateDateTime = DateTime.Now;

            try
            {
                _userMessageRepository.Add(message);
                return CreatedAtAction("Get", new { id = message.Id }, message);
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
