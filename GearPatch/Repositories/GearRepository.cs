using GearPatch.Models;
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

                                   gt.[Name] AS GearTypeName, gt.FirstOptionName, gt.SecondOptionName
                              FROM Gear g
                         LEFT JOIN UserProfile up ON up.Id = g.UserProfileId
                         LEFT JOIN GearType gt ON gt.Id = g.GearTypeId
                             WHERE (g.Headline LIKE @query OR g.Manufacturer LIKE @query OR g.Model LIKE @query OR
                                    gt.[Name] LIKE @query OR gt.FirstOptionName LIKE @query OR gt.SecondOptionName LIKE @query OR
                                    g.FirstOptionNotes LIKE @query OR g.SecondOptionNotes LIKE @query) AND
                                    up.IsActive = 1 AND g.IsActive = 1";
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

        public List<Gear> GetMine(int userId)
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
                             WHERE g.userProfileId = @userId";
                    DbUtils.AddParameter(cmd, "@userId", userId);
                    var reader = cmd.ExecuteReader();

                    var gearList = new List<Gear>();

                    while (reader.Read())
                    {
                        var gearId = DbUtils.GetInt(reader, "GearId");

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
                            UserProfileId = userId,
                            UserProfile = new UserProfile()
                            {
                                Id = userId,
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

                    reader.Close();
                    return gearList;
                }
            }
        }

        public Gear GetById(int id)
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
                             WHERE g.Id = @id";
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

        public void Add(Gear gear)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        INSERT INTO Gear (UserProfileId, Headline, Manufacturer, Model, Description,
                                          Price, IsActive, GearTypeId, ImageLocation, FirstOptionNotes,
                                          SecondOptionNotes)
                        OUTPUT INSERTED.ID
                                  VALUES (@UserProfileId, @Headline, @Manufacturer, @Model, @Description,
                                          @Price, @IsActive, @GearTypeId, @ImageLocation, @FirstOptionNotes,
                                          @SecondOptionNotes);";
                    DbUtils.AddParameter(cmd, "@UserProfileId", gear.UserProfileId);
                    DbUtils.AddParameter(cmd, "@Headline", gear.Headline);
                    DbUtils.AddParameter(cmd, "@Manufacturer", gear.Manufacturer);
                    DbUtils.AddParameter(cmd, "@Model", gear.Model);
                    DbUtils.AddParameter(cmd, "@Description", gear.Description);
                    DbUtils.AddParameter(cmd, "@Price", gear.Price);
                    DbUtils.AddParameter(cmd, "@IsActive", gear.IsActive);
                    DbUtils.AddParameter(cmd, "@GearTypeId", gear.GearTypeId);
                    DbUtils.AddParameter(cmd, "@ImageLocation", gear.ImageLocation);
                    DbUtils.AddParameter(cmd, "@FirstOptionNotes", gear.FirstOptionNotes);
                    DbUtils.AddParameter(cmd, "@SecondOptionNotes", gear.SecondOptionNotes);

                    gear.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

        public void Update(Gear gear)
        {
            using (var conn = Connection)
            {
                conn.Open();

                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"UPDATE Gear 
                                           SET UserProfileId = @UserProfileId,
                                               Headline = @Headline,
                                               Manufacturer = @Manufacturer,
                                               Model = @Model,
                                               Description = @Description,
                                               Price = @Price,
                                               IsActive = @IsActive,
                                               GearTypeId = @GearTypeId,
                                               ImageLocation = @ImageLocation,
                                               FirstOptionNotes = @FirstOptionNotes,
                                               SecondOptionNotes = @SecondOptionNotes
                                         WHERE Id = @Id;";

                    DbUtils.AddParameter(cmd, "@UserProfileId", gear.UserProfileId);
                    DbUtils.AddParameter(cmd, "@Headline", gear.Headline);
                    DbUtils.AddParameter(cmd, "@Manufacturer", gear.Manufacturer);
                    DbUtils.AddParameter(cmd, "@Model", gear.Model);
                    DbUtils.AddParameter(cmd, "@Description", gear.Description);
                    DbUtils.AddParameter(cmd, "@Price", gear.Price);
                    DbUtils.AddParameter(cmd, "@IsActive", gear.IsActive);
                    DbUtils.AddParameter(cmd, "@GearTypeId", gear.GearTypeId);
                    DbUtils.AddParameter(cmd, "@ImageLocation", gear.ImageLocation);
                    DbUtils.AddParameter(cmd, "@FirstOptionNotes", gear.FirstOptionNotes);
                    DbUtils.AddParameter(cmd, "@SecondOptionNotes", gear.SecondOptionNotes);
                    DbUtils.AddParameter(cmd, "@Id", gear.Id);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void Delete(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();

                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        DELETE FROM Accessory WHERE GearId=@Id;
                        DELETE FROM GearImages WHERE GearId=@Id;
                        DELETE FROM GearReview WHERE GearId=@Id;
                        DELETE FROM Gear WHERE Id=@Id;";
                    DbUtils.AddParameter(cmd, "@Id", id);

                    cmd.ExecuteNonQuery();
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
                }
            };
        }
    }
}
