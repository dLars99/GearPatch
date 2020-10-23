using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GearPatch.Repositories
{
    public class GearRepository : BaseRepository, IGearRepository
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
                                   g.IsActive AS GearIsActive, g.FirstOptionNotes, g.SecondOptionNotes, 
                                   g.UserProfileId, g.ImageLocation as GearImageLocation, g.GearTypeId,

                                   up.FirstName, up.LastName, up.ImageLocation AS UserImageLocation, 
                                   up.IsActive AS UserIsActive,

                                   gt.Name
                            FROM Gear g
                            LEFT JOIN UserProfile up ON up.Id = g.UserProfileId
                            LEFT JOIN GearType gt ON gt.Id = g.GearTypeId
                            WHERE up.IsActive = 1 AND g.IsActive = 1";

                    var reader = cmd.ExecuteReader();

                    var gearList = new List<Gear>();

                    while (reader.Read())
                    {
                        var gearId = DbUtils.GetInt(reader, "GearId");

                        /* Check for existing gear to be implemented with multiple images in the future
                        var existingGear = gearList.FirstOrDefault(g => g.Id == gearId);
                        if (existingGear == null)
                        {
                        */

                        var gear = new Gear()
                        {
                            Id = gearId,
                            Headline = DbUtils.GetString(reader, "Headline"),
                            Manufacturer = DbUtils.GetString(reader, "Manufacturer"),
                            Model = DbUtils.GetString(reader, "Model"),
                            Description = DbUtils.GetString(reader, "Description"),
                            Price = DbUtils.GetInt(reader, "Price"),
                            IsActive = DbUtils.GetBool(reader, "GearIsActive"),
                            FirstOptionNotes = DbUtils.GetString(reader, "FirstOptionNotes"),
                            SecondOptionNotes = DbUtils.GetString(reader, "SecondOptionNotes"),
                            ImageLocation = DbUtils.GetString(reader, "GearImageLocation"),
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
                                Name = DbUtils.GetString(reader, "Name")
                            },
                        };

                        gearList.Add(gear);
                    }

                    /* Multiple images to be implemented in the future
                    if (DbUtils.IsNotDbNull(reader, "GearTypeId"))
                    {
                        existingGear.GearImages.Add(new GearImage()
                        {
                            Id = DbUtils.GetInt(reader, "GearImageId"),
                            ImageLocation = DbUtils.GetString(reader, "GearImageLocation")
                        });
                    }
                    */

                    reader.Close();
                    return gearList;
                }
            }
        }
    }
}
