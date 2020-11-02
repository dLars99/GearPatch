﻿using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;


namespace Tabloid.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageController : ControllerBase
    {
        private readonly IWebHostEnvironment _webhost;
        public ImageController(IWebHostEnvironment webhost)
        {
            _webhost = webhost;
        }

        [HttpPost("gear")]
        public IActionResult UploadGearImage(IFormFile file)
        {
            //where images are stored
            var savedImagePath = Path.Combine(_webhost.WebRootPath, "gear-images", file.FileName);
            try
            {
                using var image = Image.Load(file.OpenReadStream());

                int originalWidth = image.Width;
                int originalHeight = image.Height;


                int maxWidth = 640;
                if (originalWidth > maxWidth)
                {
                    int newHeight = maxWidth * originalHeight;
                    newHeight /= originalWidth;

                    image.Mutate(i => i.Resize(maxWidth, newHeight));
                }

                image.Save(savedImagePath);
            }
            catch
            {
                return Conflict();
            }

            return Ok();
        }

        [HttpGet("gear/{imageUrl}")]
        public IActionResult GetGearImage(string imageUrl)
        {
            var path = Path.Combine(_webhost.WebRootPath, "gear-images", imageUrl);
            var imageFileStream = System.IO.File.OpenRead(path);
            return File(imageFileStream, "image/jpeg");
        }
    }
}