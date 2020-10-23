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
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GearController : ControllerBase
    {
        private readonly IGearRepository _gearRepository;
        public GearController(IGearRepository gearRepository)
        {
            _gearRepository = gearRepository;
        }

        [HttpGet("search")]
        public IActionResult Search(string q)
        {
            return Ok(_gearRepository.GetSearchResults(q));
        }
    }
}
