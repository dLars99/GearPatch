using System;
using System.ComponentModel.DataAnnotations;

namespace GearPatch.Models
{
    public class UserMessage
    {
        public int Id { get; set; }
        [Required]
        public int SenderId { get; set; }
        public UserProfile Sender { get; set; }
        [Required]
        public int RecipientId { get; set; }
        public UserProfile Recipient { get; set; }
        [Required]
        public bool Unread { get; set; }
        [Required]
        [StringLength(1000, MinimumLength = 2)]
        public string Content { get; set; }
        public DateTime CreateDateTime { get; set; }
        public UserMessage()
        {
            Unread = true;
        }
    }
}
