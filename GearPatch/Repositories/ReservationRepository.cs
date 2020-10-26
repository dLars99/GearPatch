using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GearPatch.Repositories
{
    public class ReservationRepository : BaseRepository, IReservationRepository
    {
        public ReservationRepository(IConfiguration configuration) : base(configuration) { }

        public Reservation GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned
                          FROM Reservation
                         WHERE Id = @Id";
                    DbUtils.AddParameter(cmd, "@Id", id);

                    var reader = cmd.ExecuteReader();

                    Reservation reservation = null;

                    if (reader.Read())
                    {
                        reservation = new Reservation()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            OwnerId = DbUtils.GetInt(reader, "OwnerId"),
                            CustomerId = DbUtils.GetInt(reader, "CustomerId"),
                            GearId = DbUtils.GetInt(reader, "GearId"),
                            AgreedPrice = DbUtils.GetInt(reader, "AgreedPrice"),
                            StartDate = DbUtils.GetDateTime(reader, "StartDate"),
                            EndDate = DbUtils.GetDateTime(reader, "EndDate"),
                            Confirmed = DbUtils.GetBool(reader, "Confirmed"),
                            ItemReturned = DbUtils.GetBool(reader, "ItemReturned")
                        };
                    }

                    reader.Close();
                    return reservation;
                }
            }
        }

        public void Add(Reservation reservation)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        INSERT INTO Post (OwnerId, CustomerId, GearId, AgreedPrice, StartDate,
                                          EndDate, Confirmed, ItemReturned)
                        OUTPUT INSERTED.ID
                                  VALUES (@OwnerId, @CustomerId, @GearId, @AgreedPrice, @StartDate,
                                          @EndDate, @Confirmed, @ItemReturned);";

                    DbUtils.AddParameter(cmd, "@OwnerId", reservation.OwnerId);
                    DbUtils.AddParameter(cmd, "@CustomerId", reservation.CustomerId);
                    DbUtils.AddParameter(cmd, "@GearId", reservation.GearId);
                    DbUtils.AddParameter(cmd, "@AgreedPrice", reservation.AgreedPrice);
                    DbUtils.AddParameter(cmd, "@StartDate", reservation.StartDate);
                    DbUtils.AddParameter(cmd, "@EndDate", reservation.EndDate);
                    DbUtils.AddParameter(cmd, "@Confirmed", reservation.Confirmed);
                    DbUtils.AddParameter(cmd, "@ItemReturned", reservation.ItemReturned);

                    reservation.Id = (int)cmd.ExecuteScalar();

                }
            }
        }
    }
}
