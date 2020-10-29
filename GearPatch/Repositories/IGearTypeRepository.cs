using GearPatch.Models;
using System.Collections.Generic;

namespace GearPatch.Repositories
{
    public interface IGearTypeRepository
    {
        List<GearType> GetAll();
    }
}