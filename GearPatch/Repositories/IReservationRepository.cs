using System;
using System.Collections.Generic;
using GearPatch.Models;

namespace GearPatch.Repositories
{
    public interface IReservationRepository
    {
        List<Reservation> GetByUserId(int id);
        Reservation GetById(int id);
        int NewRequestCount(int userId);
        void Add(Reservation reservation);
        bool CheckAvailability(int gearId, DateTime startDate, DateTime endDate);
        void Update(Reservation reservation);
        void Delete(int id);
    }
}