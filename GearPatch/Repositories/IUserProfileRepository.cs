using GearPatch.Models;

namespace GearPatch.Repositories
{
    public interface IUserProfileRepository
    {
        void Add(UserProfile userProfile);
        UserProfile GetByFirebaseId(string firebaseId);
    }
}