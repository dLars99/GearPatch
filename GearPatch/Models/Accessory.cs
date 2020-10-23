using System.ComponentModel.DataAnnotations;

namespace GearPatch.Models
{
    public class Accessory
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }
        [Required]
        [MaxLength(500)]
        public string Description { get; set; }
        [Required]
        public int GearId { get; set; }
    }
}
