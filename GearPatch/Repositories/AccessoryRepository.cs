using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;

namespace GearPatch.Repositories
{
    public class AccessoryRepository : BaseRepository, IAccessoryRepository
    {
        public AccessoryRepository(IConfiguration configuration) : base(configuration) { }


        public Accessory GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, GearId, Name, Description
                          FROM Accessory";

                    var reader = cmd.ExecuteReader();

                    Accessory accessory = null;

                    if (reader.Read())
                    {
                        accessory = new Accessory()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            GearId = DbUtils.GetInt(reader, "GearId"),
                            Name = DbUtils.GetString(reader, "Name"),
                            Description = DbUtils.GetString(reader, "Description")
                        };
                    }

                    reader.Close();
                    return accessory;                    
                }
            }
        }

        public void Add(Accessory accessory)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        INSERT INTO Accessory (GearId, Name, Description)
                        OUTPUT INSERTED.ID
                                  VALUES (@GearId, @Name, @Description);";

                    DbUtils.AddParameter(cmd, "@GearId", accessory.GearId);
                    DbUtils.AddParameter(cmd, "@Name", accessory.Name);
                    DbUtils.AddParameter(cmd, "@Description", accessory.Description);

                    accessory.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

        public void Update(Accessory accessory)
        {
            using (var conn = Connection)
            {
                conn.Open();

                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"UPDATE Accessory 
                                           SET Name = @Name,
                                               Description = @Description,
                                               GearId = @GearId
                                         WHERE Id = @Id;";

                    DbUtils.AddParameter(cmd, "@Name", accessory.Name);
                    DbUtils.AddParameter(cmd, "@Description", accessory.Description);
                    DbUtils.AddParameter(cmd, "@GearId", accessory.GearId);
                    DbUtils.AddParameter(cmd, "@Id", accessory.Id);

                    cmd.ExecuteNonQuery();
                }
            }

        }
    }
}
