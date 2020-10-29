using GearPatch.Models;

namespace GearPatch.Repositories
{
    public interface IAccessoryRepository
    {
        Accessory GetById(int id);
        void Add(Accessory accessory);
    }
}