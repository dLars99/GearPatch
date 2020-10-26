﻿using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

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

                                   up.FirstName, up.LastName, up.Bio, up.ImageLocation AS UserImageLocation, 
                                   up.IsActive AS UserIsActive,

                                   gt.Name AS GearTypeName, gt.FirstOptionName, gt.SecondOptionName
                              FROM Gear g
                         LEFT JOIN UserProfile up ON up.Id = g.UserProfileId
                         LEFT JOIN GearType gt ON gt.Id = g.GearTypeId
                             WHERE (g.Headline LIKE @query OR g.Manufacturer LIKE @query OR g.Model LIKE @query)
                                   AND up.IsActive = 1 AND g.IsActive = 1";
                    DbUtils.AddParameter(cmd, "@query", $"%{query}%");

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
                                Name = DbUtils.GetString(reader, "GearTypeName")
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

        public Gear GetActiveGearById(int id)
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

                                   up.FirstName, up.LastName, up.Bio, up.ImageLocation AS UserImageLocation, 
                                   up.IsActive AS UserIsActive,

                                   gt.Name AS GearTypeName, gt.FirstOptionName, gt.SecondOptionName,

                                   a.Id AS AccessoryId, a.Name AS AccessoryName, a.Description AS AccessoryDescription
                              FROM Gear g
                         LEFT JOIN UserProfile up ON up.Id = g.UserProfileId
                         LEFT JOIN GearType gt ON gt.Id = g.GearTypeId
                         LEFT JOIN Accessory a ON a.GearId = g.Id
                             WHERE g.Id = @id AND g.IsActive = 1";
                    DbUtils.AddParameter(cmd, "@id", id);

                    var reader = cmd.ExecuteReader();

                    Gear gear = null;

                    while (reader.Read())
                    {
                        var gearId = DbUtils.GetInt(reader, "GearId");

                        if (gear == null)
                        {
                            gear = GearFromDb(reader);
                            gear.Accessories = new List<Accessory>();
                        }

                        if (DbUtils.IsNotDbNull(reader, "AccessoryId"))
                        {
                            gear.Accessories.Add(new Accessory()
                            {
                                Id = DbUtils.GetInt(reader, "AccessoryId"),
                                Name = DbUtils.GetString(reader, "AccessoryName"),
                                Description = DbUtils.GetString(reader, "Description"),
                                GearId = gear.Id
                            });
                        }
                    }

                    /* Multiple images to be implemented in the future
                    if (DbUtils.IsNotDbNull(reader, "GearImageId"))
                    {
                        existingGear.GearImages.Add(new GearImage()
                        {
                            Id = DbUtils.GetInt(reader, "GearImageId"),
                            ImageLocation = DbUtils.GetString(reader, "GearImageLocation")
                        });
                    }
                    */

                    reader.Close();
                    return gear;
                }
            }
        }

        public List<Gear> GetThreeRandomByUser(int userId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                    SELECT TOP 3 g.Id AS GearId, g.Headline, g.Manufacturer, g.Model, g.Description, g.Price,
                            g.IsActive AS GearIsActive, g.FirstOptionNotes, g.SecondOptionNotes, 
                            g.UserProfileId, g.ImageLocation as GearImageLocation, g.GearTypeId,

                            up.FirstName, up.LastName, up.Bio, up.ImageLocation AS UserImageLocation, 
                            up.IsActive AS UserIsActive,

                            gt.Name AS GearTypeName, gt.FirstOptionName, gt.SecondOptionName
                        FROM Gear g
                    LEFT JOIN UserProfile up ON up.Id = g.UserProfileId
                    LEFT JOIN GearType gt ON gt.Id = g.GearTypeId
                        WHERE up.Id = @id AND g.IsActive = 1
                    ORDER BY NEWID()";
                    DbUtils.AddParameter(cmd, "@id", userId);

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

                        var gear = GearFromDb(reader);

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

        private Gear GearFromDb(SqlDataReader reader)
        {
            return new Gear()
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
                ImageLocation = DbUtils.GetString(reader, "GearImageLocation"),
                UserProfileId = DbUtils.GetInt(reader, "UserProfileId"),
                UserProfile = new UserProfile()
                {
                    FirstName = DbUtils.GetString(reader, "FirstName"),
                    LastName = DbUtils.GetString(reader, "LastName"),
                    Bio = DbUtils.GetString(reader, "Bio"),
                    ImageLocation = DbUtils.GetString(reader, "UserImageLocation"),
                    IsActive = DbUtils.GetBool(reader, "UserIsActive")
                },
                GearTypeId = DbUtils.GetInt(reader, "GearTypeId"),
                GearType = new GearType()
                {
                    Id = DbUtils.GetInt(reader, "GearTypeId"),
                    Name = DbUtils.GetString(reader, "GearTypeName"),
                    FirstOptionName = DbUtils.GetString(reader, "FirstOptionName"),
                    SecondOptionName = DbUtils.GetString(reader, "SecondOptionName")
                },
            };
        }
    }
}
