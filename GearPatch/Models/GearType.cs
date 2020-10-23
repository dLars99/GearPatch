using System.ComponentModel.DataAnnotations;

namespace GearPatch.Models
{
    public class GearType
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }
        [MaxLength(50)]
        public string FirstOptionName { get; set; }
        [MaxLength(50)]
        public string SecondOptionName { get; set; }
    }
}
