using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
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
    public class ReservationController : ControllerBase
    {
        private readonly IReservationRepository _reservationRepository;
        private readonly IUserProfileRepository _userProfileRepository;

        public ReservationController(IReservationRepository reservationRepository, 
                                    IUserProfileRepository userProfileRepository)
        {
            _reservationRepository = reservationRepository;
            _userProfileRepository = userProfileRepository;
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var reservation = _reservationRepository.GetById(id);
            if (reservation == null)
            {
                return NotFound();
            }

            return Ok(reservation);
        }

        [HttpPost]
        public IActionResult Post(Reservation reservation)
        {
            // Validations
            if (reservation.StartDate > reservation.EndDate)
            {
                return BadRequest();
            }

            var currentUser = GetCurrentUserProfile();
            reservation.CustomerId = currentUser.Id;
            reservation.Confirmed = false;
            reservation.ItemReturned = false;

            try
            {
                _reservationRepository.Add(reservation);
                return CreatedAtAction("Get", new { id = reservation.Id }, reservation);
            }
            catch
            {
                return StatusCode(500);
            }

        }

        private UserProfile GetCurrentUserProfile()
        {
            var firebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userProfileRepository.GetByFirebaseId(firebaseUserId);
        }

    }
}
