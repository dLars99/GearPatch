using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;

namespace GearPatch.Repositories
{
    public class UserProfileRepository : BaseRepository, IUserProfileRepository
    {
        public UserProfileRepository(IConfiguration configuration) : base(configuration) { }
        public UserProfile GetByFirebaseId(string firebaseId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, Bio, IsActive
                          FROM UserProfile
                         WHERE FirebaseId = @FirebaseId";

                    DbUtils.AddParameter(cmd, "@FirebaseId", firebaseId);

                    UserProfile userProfile = null;

                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userProfile = new UserProfile()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            FirstName = DbUtils.GetString(reader, "FirstName"),
                            LastName = DbUtils.GetString(reader, "LastName"),
                            Email = DbUtils.GetString(reader, "Email"),
                            Phone = DbUtils.GetString(reader, "Phone"),
                            FirebaseId = DbUtils.GetString(reader, "FirebaseId"),
                            ImageLocation = DbUtils.GetString(reader, "ImageLocation"),
                            Bio = DbUtils.GetString(reader, "Bio"),
                            IsActive = DbUtils.GetBool(reader, "IsActive")
                        };
                    }
                    reader.Close();

                    return userProfile;
                }
            }
        }

        public UserProfile GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive
                          FROM UserProfile
                         WHERE Id = @Id";

                    DbUtils.AddParameter(cmd, "@Id", id);

                    UserProfile userProfile = null;

                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userProfile = new UserProfile()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            FirstName = DbUtils.GetString(reader, "FirstName"),
                            LastName = DbUtils.GetString(reader, "LastName"),
                            Email = DbUtils.GetString(reader, "Email"),
                            Phone = DbUtils.GetString(reader, "Phone"),
                            FirebaseId = DbUtils.GetString(reader, "FirebaseId"),
                            ImageLocation = DbUtils.GetString(reader, "ImageLocation"),
                            IsActive = DbUtils.GetBool(reader, "IsActive")
                        };
                    }
                    reader.Close();

                    return userProfile;
                }
            }

        }

        public void Add(UserProfile userProfile)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"INSERT INTO UserProfile (FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive)
                                        OUTPUT INSERTED.ID
                                        VALUES (@FirstName, @LastName, @Email, @Phone, @Bio, @FirebaseId, @ImageLocation, @IsActive)";
                    DbUtils.AddParameter(cmd, "@FirstName", userProfile.FirstName);
                    DbUtils.AddParameter(cmd, "@LastName", userProfile.LastName);
                    DbUtils.AddParameter(cmd, "@Email", userProfile.Email);
                    DbUtils.AddParameter(cmd, "@Phone", userProfile.Phone);
                    DbUtils.AddParameter(cmd, "@Bio", userProfile.Bio);
                    DbUtils.AddParameter(cmd, "@FirebaseId", userProfile.FirebaseId);
                    DbUtils.AddParameter(cmd, "@ImageLocation", userProfile.ImageLocation);
                    DbUtils.AddParameter(cmd, "@IsActive", userProfile.IsActive);

                    userProfile.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

        public void Update(UserProfile userProfile)
        {
            using (var conn = Connection)
            {
                conn.Open();

                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"UPDATE UserProfile 
                                           SET FirstName = @FirstName,
                                               LastName = @LastName,
                                               Email = @Email,
                                               Phone = @Phone,
                                               Bio = @Bio,
                                               IsActive = @IsActive,
                                               FirebaseId = @FirebaseId,
                                               ImageLocation = @ImageLocation
                                         WHERE Id = @Id;";

                    DbUtils.AddParameter(cmd, "@FirstName", userProfile.FirstName);
                    DbUtils.AddParameter(cmd, "@LastName", userProfile.LastName);
                    DbUtils.AddParameter(cmd, "@Email", userProfile.Email);
                    DbUtils.AddParameter(cmd, "@Phone", userProfile.Phone);
                    DbUtils.AddParameter(cmd, "@Bio", userProfile.Bio);
                    DbUtils.AddParameter(cmd, "@IsActive", userProfile.IsActive);
                    DbUtils.AddParameter(cmd, "@FirebaseId", userProfile.FirebaseId);
                    DbUtils.AddParameter(cmd, "@ImageLocation", userProfile.ImageLocation);
                    DbUtils.AddParameter(cmd, "@Id", userProfile.Id);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}

