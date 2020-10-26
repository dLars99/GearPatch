using System;
using GearPatch.Models;

namespace GearPatch.Repositories
{
    public interface IReservationRepository
    {
        Reservation GetById(int id);
        void Add(Reservation reservation);
        bool CheckAvailability(int gearId, DateTime startDate, DateTime endDate);
    }
}