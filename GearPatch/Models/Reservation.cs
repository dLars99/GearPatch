using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace GearPatch.Models
{
    public class Reservation
    {
        public int Id { get; set; }
        [Required]
        public int OwnerId { get; set; }
        public UserProfile Owner { get; set; }
        [Required]
        public int CustomerId { get; set; }
        public UserProfile Customer { get; set; }
        [Required]
        public int GearId { get; set; }
        public Gear Gear { get; set; }
        [Required]
        public int AgreedPrice { get; set; }
        [Required]
        public DateTime StartDate { get; set; }
        [Required]
        public DateTime EndDate { get; set; }
        public bool Confirmed { get; set; }
        public bool ItemReturned { get; set; }
    }
}
