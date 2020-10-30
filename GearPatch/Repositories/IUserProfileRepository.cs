using GearPatch.Models;

namespace GearPatch.Repositories
{
    public interface IUserProfileRepository
    {
        UserProfile GetByFirebaseId(string firebaseId);
        UserProfile GetById(int id);
        void Add(UserProfile userProfile);
        void Update(UserProfile userProfile);
    }
}