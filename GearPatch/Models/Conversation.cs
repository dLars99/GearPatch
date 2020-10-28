using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GearPatch.Models
{
    public class Conversation
    {
        // No Id for this class, as it is not stored in the DB
        public int OtherUserId { get; set; }
        public UserProfile OtherUser { get; set; }
        public int MessageCount { get; set; }
        public int UnreadMessages { get; set; }
    }
}
