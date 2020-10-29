using GearPatch.Models;
using System.Collections.Generic;

namespace GearPatch.Repositories
{
    public interface IGearRepository
    {
        List<Gear> GetSearchResults(string query);
        public List<Gear> GetMine(int userId);
        Gear GetById(int id);
        List<Gear> GetThreeRandomByUser(int userId);
        public void Add(Gear gear);
    }
}