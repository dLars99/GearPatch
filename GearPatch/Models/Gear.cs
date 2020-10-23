using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GearPatch.Models
{
    public class Gear
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Headline { get; set; }
        [Required]
        [MaxLength(40)]
        public string Manufacturer { get; set; }
        [Required]
        [MaxLength(40)]
        public string Model { get; set; }
        public string Description { get; set; }
        [Required]
        public int Price { get; set; }
        [Required]
        public bool IsActive { get; set; }
        [Required]
        public int UserProfileId { get; set; }
        public UserProfile UserProfile { get; set; }
        [Required]
        public int GearTypeId { get; set; }
        public GearType GearType { get; set; }
        [MaxLength(255)]
        public string FirstOptionNotes { get; set; }
        [MaxLength(255)]
        public string SecondOptionNotes { get; set; }
        public List<Accessory> Accessories { get; set; }

    }
}
