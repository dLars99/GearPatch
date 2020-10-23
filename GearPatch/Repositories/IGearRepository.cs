using GearPatch.Models;
using System.Collections.Generic;

namespace GearPatch.Repositories
{
    public interface IGearRepository
    {
        List<Gear> GetSearchResults(string query);
    }
}