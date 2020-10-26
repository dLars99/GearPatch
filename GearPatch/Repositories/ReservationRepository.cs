using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GearPatch.Repositories
{
    public class ReservationRepository : BaseRepository, IReservationRepository
    {
        public ReservationRepository(IConfiguration configuration) : base(configuration) { }

        public List<Reservation> GetByUserId(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT r.Id AS ReservationId, r.OwnerId, r.CustomerId, r.GearId, r.AgreedPrice, 
                               r.StartDate, r.EndDate, r.Confirmed, r.ItemReturned,

                               g.Id AS GearId, g.Headline, g.Manufacturer, g.Model, g.Description, g.Price,
                               g.IsActive AS GearIsActive, g.ImageLocation as GearImageLocation, g.GearTypeId,

                               gt.Name AS GearTypeName,

                               op.FirstName AS OwnerFirstName, op.LastName AS OwnerLastName, op.Bio AS OwnerBio, 
                               op.ImageLocation AS OwnerImageLocation, op.IsActive AS OwnerIsActive,

                               cp.FirstName AS CustomerFirstName, cp.LastName AS CustomerLastName, cp.Bio AS CustomerBio, 
                               cp.ImageLocation AS CustomerImageLocation, cp.IsActive AS CustomerIsActive
                               
                          FROM Reservation r
                     LEFT JOIN UserProfile op ON op.Id = r.OwnerId
                     LEFT JOIN UserProfile cp ON cp.Id = r.CustomerId
                     LEFT JOIN Gear g on g.Id = r.GearId
                     LEFT JOIN GearType gt on gt.Id = g.GearTypeId
                         WHERE r.OwnerId = @Id OR r.CustomerId = @Id";
                    DbUtils.AddParameter(cmd, "@Id", id);
                    var reader = cmd.ExecuteReader();

                    var reservations = new List<Reservation>();

                    while (reader.Read())
                    {
                        var reservation = ReservationFromDb(reader);
                        reservation.Owner = new UserProfile()
                        {
                            Id = reservation.OwnerId,
                            FirstName = DbUtils.GetString(reader, "OwnerFirstName"),
                            LastName = DbUtils.GetString(reader, "OwnerLastName"),
                            Bio = DbUtils.GetString(reader, "OwnerBio"),
                            ImageLocation = DbUtils.GetString(reader, "OwnerImageLocation"),
                            IsActive = DbUtils.GetBool(reader, "OwnerIsActive")
                        };

                        reservation.Customer = new UserProfile()
                        {
                            Id = reservation.CustomerId,
                            FirstName = DbUtils.GetString(reader, "CustomerFirstName"),
                            LastName = DbUtils.GetString(reader, "CustomerLastName"),
                            Bio = DbUtils.GetString(reader, "CustomerBio"),
                            ImageLocation = DbUtils.GetString(reader, "CustomerImageLocation"),
                            IsActive = DbUtils.GetBool(reader, "CustomerIsActive")

                        };

                        reservation.Gear = new Gear()
                        {
                            Id = reservation.GearId,
                            Headline = DbUtils.GetString(reader, "Headline"),
                            Manufacturer = DbUtils.GetString(reader, "Manufacturer"),
                            Model = DbUtils.GetString(reader, "Model"),
                            Description = DbUtils.GetString(reader, "Description"),
                            Price = DbUtils.GetInt(reader, "Price"),
                            IsActive = DbUtils.GetBool(reader, "GearIsActive"),
                            ImageLocation = DbUtils.GetString(reader, "GearImageLocation"),
                            UserProfileId = reservation.OwnerId,
                            GearTypeId = DbUtils.GetInt(reader, "GearTypeId"),
                            GearType = new GearType()
                            {
                                Id = DbUtils.GetInt(reader, "GearTypeId"),
                                Name = DbUtils.GetString(reader, "GearTypeName"),
                            },

                        };
                        reservations.Add(reservation);
                    }

                    reader.Close();
                    return reservations;
                }
            }
        }

        public Reservation GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id AS ReservationId, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned
                          FROM Reservation
                         WHERE Id = @Id";
                    DbUtils.AddParameter(cmd, "@Id", id);

                    var reader = cmd.ExecuteReader();

                    Reservation reservation = null;

                    if (reader.Read())
                    {
                        reservation = ReservationFromDb(reader);
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
                        INSERT INTO Reservation (OwnerId, CustomerId, GearId, AgreedPrice, StartDate,
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

        public bool CheckAvailability(int gearId, DateTime startDate, DateTime endDate)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"SELECT Id FROM Reservation
                                         WHERE GearId = @GearId
                                               AND ((StartDate >= @StartDate AND StartDate <= @EndDate)
                                               OR (EndDate >= @StartDate AND EndDate <= @EndDate))";
                    DbUtils.AddParameter(cmd, "@GearId", gearId);
                    DbUtils.AddParameter(cmd, "@StartDate", startDate);
                    DbUtils.AddParameter(cmd, "@EndDate", endDate);
                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Unavailable
                        reader.Close();
                        return false;
                    }

                    // Available
                    reader.Close();
                    return true;
                }
            }
        }

        private Reservation ReservationFromDb(SqlDataReader reader)
        {
            return new Reservation()
            {
                Id = DbUtils.GetInt(reader, "ReservationId"),
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
    }
}
