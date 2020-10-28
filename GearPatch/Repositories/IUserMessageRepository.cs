using GearPatch.Models;
using System.Collections.Generic;

namespace GearPatch.Repositories
{
    public interface IUserMessageRepository
    {
        void Add(UserMessage message);
        List<UserMessage> GetByUser(int currentUserId, int otherUserId);
        List<Conversation> GetConversationsByUser(int id);
        UserMessage GetById(int id);
        int NewMessageCount(int userId);
    }
}