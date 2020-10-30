using System.ComponentModel.DataAnnotations;

namespace GearPatch.Models
{
    public class UserProfile
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(40)]
        public string FirstName { get; set; }
        [Required]
        [MaxLength(40)]
        public string LastName { get; set; }
        [Required]
        [EmailAddress]
        [MaxLength(255)]
        public string Email { get; set; }
        [Required]
        [Phone]
        [MaxLength(20)]
        public string Phone { get; set; }
        [Required]
        [StringLength(28, MinimumLength = 28)]
        public string FirebaseId { get; set; }
        [Required]
        public string Bio { get; set; }
        [Url]
        [MaxLength(255)]
        public string ImageLocation { get; set; }
        [Required]
        public bool IsActive { get; set; }
        public string FullName
        {
            get
            {
                return $"{FirstName} {LastName[0]}.";
            }
        }
        public UserProfile()
        {
            IsActive = true;
        }
    }
}
