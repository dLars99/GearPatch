using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GearPatch.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GearPatch.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GearTypeController : ControllerBase
    {
        private readonly IGearTypeRepository _gearTypeRepository;
        public GearTypeController(IGearTypeRepository gearTypeRepository)
        {
            _gearTypeRepository = gearTypeRepository;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_gearTypeRepository.GetAll());
        }
    }
}
