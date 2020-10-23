using System.ComponentModel.DataAnnotations;

namespace GearPatch.Models
{
    public class GearImages
    {
        public int Id { get; set; }
        [Required]
        public int GearId { get; set; }
        [Required]
        [Url]
        [MaxLength(255)]
        public string ImageLocation { get; set; }
    }
}
