using GearPatch.Models;
using System.Collections.Generic;

namespace GearPatch.Repositories
{
    public interface IGearRepository
    {
        List<Gear> GetSearchResults(string query);
        List<Gear> GetMine(int userId);
        Gear GetById(int id);
        List<Gear> GetThreeRandomByUser(int userId);
        void Add(Gear gear);
        void Update(Gear gear);
        void Delete(int id);
    }
}