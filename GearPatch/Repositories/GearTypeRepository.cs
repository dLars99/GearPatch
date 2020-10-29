using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GearPatch.Repositories
{
    public class GearTypeRepository : BaseRepository, IGearTypeRepository
    {
        public GearTypeRepository(IConfiguration configuration) : base(configuration) { }

        public List<GearType> GetAll()
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, Name, FirstOptionName, SecondOptionName
                          FROM GearType";

                    var reader = cmd.ExecuteReader();
                    var gearTypes = new List<GearType>();

                    while (reader.Read())
                    {
                        gearTypes.Add(new GearType()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            Name = DbUtils.GetString(reader, "Name"),
                            FirstOptionName = DbUtils.GetString(reader, "FirstOptionName"),
                            SecondOptionName = DbUtils.GetString(reader, "SecondOptionName")
                        });
                    }

                    reader.Close();
                    return gearTypes;
                }
            }
        }
    }
}
