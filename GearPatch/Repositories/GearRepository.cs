using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GearPatch.Repositories
{
    public class GearRepository : BaseRepository
    {
        public GearRepository(IConfiguration configuration) : base(configuration) { }

        public List<Gear> GetSearchResults(string query)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                            SELECT g.Id AS GearId, g.Headline, g.Manufacturer, g.Model, g.Description, g.Price,
                                   g.IsActive, AS GearIsActive, g.FirstOptionNotes, g.SecondOptionNotes, 
                                   g.UserProfileId, g.GearTypeId

                                   up.FirstName, up.LastName, up.ImageLocation AS UserImageLocation, 
                                   up.IsActive AS UserIsActive

                                   gt.Name,
                                   
                                   gi.Id AS GearImageId, gi.ImageLocation AS GearImageLocation
                            FROM Gear g
                            LEFT JOIN UserProfile up ON up.Id = g.UserProfileId
                            LEFT JOIN GearType gt ON gt.Id = g.GearTypeId
                            LEFT JOIN GearImage gi on gi.GearId = g.Id
                            WHERE UserIsActive = 1 AND GearIsActive = 1";

                    var reader = cmd.ExecuteReader();

                    var gearList = new List<Gear>();

                    while (reader.Read())
                    {
                        var gear = new Gear()
                        {
                            Id = DbUtils.GetInt(reader, "GearId"),
                            Headline = DbUtils.GetString(reader, "Headline"),
                            Manufacturer = DbUtils.GetString(reader, "Manufacturer"),
                            Model = DbUtils.GetString(reader, "Model"),
                            Description = DbUtils.GetString(reader, "Description"),
                            Price = DbUtils.GetInt(reader, "Price"),
                            IsActive = DbUtils.GetBool(reader, "GearIsActive"),
                            FirstOptionNotes = DbUtils.GetString(reader, "FirstOptionNotes"),
                            SecondOptionNotes = DbUtils.GetString(reader, "SecondOptionNotes"),
                            UserProfileId = DbUtils.GetInt(reader, "UserProfileId"),
                            UserProfile = new UserProfile()
                            {
                                FirstName = DbUtils.GetString(reader, "FirstName"),
                                LastName = DbUtils.GetString(reader, "LastName"),
                                ImageLocation = DbUtils.GetString(reader, "UserImageLocation"),
                                IsActive = DbUtils.GetBool(reader, "UserIsActive")
                            },
                            GearTypeId = DbUtils.GetInt(reader, "GearTypeId"),
                            GearType = new GearType()
                            {
                                Id = DbUtils.GetInt(reader, "GearTypeId"),
                                Name = DbUtils.GetString(reader,"Name")
                            },
                            GearImages = new List<GearImage>()
                        };

                        gear.GearImages.Add(new GearImage()
                        {
                            Id = DbUtils.GetInt(reader, "GearImageId"),
                            ImageLocation = DbUtils.GetString(reader, "GearImageLocation")
                        });
                    }

                    reader.Close();
                    return gearList;

                }
            }
        }
    }
}
