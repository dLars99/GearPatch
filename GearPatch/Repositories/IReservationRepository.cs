using System;
using System.Collections.Generic;
using GearPatch.Models;

namespace GearPatch.Repositories
{
    public interface IReservationRepository
    {
        List<Reservation> GetByUserId(int id);
        Reservation GetById(int id);
        void Add(Reservation reservation);
        bool CheckAvailability(int gearId, DateTime startDate, DateTime endDate);
    }
}