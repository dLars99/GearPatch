using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GearPatch.Models;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GearPatch.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccessoryController : ControllerBase
    {
        private readonly IAccessoryRepository _accessoryRepository;

        public AccessoryController(IAccessoryRepository accessoryRepository)
        {
            _accessoryRepository = accessoryRepository;
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var accessory = _accessoryRepository.GetById(id);
            if (accessory == null)
            {
                return NotFound();
            }

            return Ok(accessory);
        }
        
        [HttpPost]
        public IActionResult Post(Accessory accessory)
        {
            try
            {
                _accessoryRepository.Add(accessory);
                return CreatedAtAction("Get", new { id = accessory.Id }, accessory);
            }
            catch
            {
                return StatusCode(500);
            }
        }
    }
}
