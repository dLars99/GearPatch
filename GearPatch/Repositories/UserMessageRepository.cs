﻿using GearPatch.Models;
using GearPatch.Utils;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GearPatch.Repositories
{
    public class UserMessageRepository : BaseRepository, IUserMessageRepository
    {
        public UserMessageRepository(IConfiguration configuration) : base(configuration) { }

        public List<UserMessage> GetByUser(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, SenderId, RecipientId, Unread, Content
                          FROM UserMessage
                         WHERE SenderId = @Id OR RecipientId = @Id;";
                    DbUtils.AddParameter(cmd, "@Id", id);

                    var reader = cmd.ExecuteReader();

                    var messages = new List<UserMessage>();

                    while (reader.Read())
                    {
                        messages.Add(new UserMessage()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            SenderId = DbUtils.GetInt(reader, "SenderId"),
                            RecipientId = DbUtils.GetInt(reader, "RecipientId"),
                            Unread = DbUtils.GetBool(reader, "Unread"),
                            Content = DbUtils.GetString(reader, "Content")
                        });
                    }

                    reader.Close();
                    return messages;
                }
            }
        }

        public List<Conversation> GetConversationsByUser(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT MessageCount, UnreadCount, msg.OtherParty,

                               up.LastName, up.FirstName, up.ImageLocation, up.IsActive
                          FROM (SELECT Count(Id) AS MessageCount, OtherParty
                                  FROM (SELECT Id, SenderId AS OtherParty
                                          FROM UserMessage
                                         WHERE RecipientId = @Id
                                     UNION ALL
                                        SELECT Id, RecipientId AS OtherParty
                                          FROM UserMessage
                                         WHERE SenderId = @Id) AllMessages
                              GROUP BY OtherParty) msg
                     FULL JOIN (SELECT Count(Id) AS UnreadCount, OtherParty
                                  FROM (SELECT Id, SenderId AS OtherParty
                                          FROM UserMessage
                                         WHERE RecipientId = @Id AND Unread = 1
                                     UNION ALL
                                        SELECT Id, RecipientId AS OtherParty
                                          FROM UserMessage
                                         WHERE SenderId = @Id AND Unread = 1) UnreadMessages
                               GROUP BY OtherParty) unr
                               ON msg.OtherParty = unr.OtherParty
                    
                     LEFT JOIN UserProfile up on up.Id = msg.OtherParty
                        ORDER BY UnreadCount DESC";
                    DbUtils.AddParameter(cmd, "@Id", id);

                    var reader = cmd.ExecuteReader();

                    var conversations = new List<Conversation>();

                    while (reader.Read())
                    {
                        conversations.Add(new Conversation()
                        {
                            OtherUserId = DbUtils.GetInt(reader, "OtherParty"),
                            OtherUser = new UserProfile()
                            {
                                Id = DbUtils.GetInt(reader, "OtherParty"),
                                FirstName = DbUtils.GetString(reader, "FirstName"),
                                LastName = DbUtils.GetString(reader, "LastName"),
                                ImageLocation = DbUtils.GetString(reader, "ImageLocation"),
                                IsActive = DbUtils.GetBool(reader, "IsActive")
                            },
                            MessageCount = DbUtils.GetZeroIfNullInt(reader, "MessageCount"),
                            UnreadMessages = DbUtils.GetZeroIfNullInt(reader, "UnreadCount"),
                        });
                    }

                    reader.Close();
                    return conversations;
                }
            }
        }

        public UserMessage GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Id, SenderId, RecipientId, Unread, Content, CreateDateTime
                          FROM UserMessage
                         WHERE Id=@Id";
                    DbUtils.AddParameter(cmd, "@Id", id);

                    var reader = cmd.ExecuteReader();

                    UserMessage message = null;

                    if (reader.Read())
                    {
                        message = new UserMessage()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            SenderId = DbUtils.GetInt(reader, "SenderId"),
                            RecipientId = DbUtils.GetInt(reader, "RecipientId"),
                            Unread = DbUtils.GetBool(reader, "Unread"),
                            Content = DbUtils.GetString(reader, "Content"),
                            CreateDateTime = DbUtils.GetDateTime(reader, "CreateDateTime")
                        };
                    }

                    reader.Close();
                    return message;
                }
            }
        }

        public void Add(UserMessage message)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        INSERT INTO UserMessage (SenderId, RecipientId, Unread, Content, CreateDateTime)
                        OUTPUT INSERTED.ID
                             VALUES (@SenderId, @RecipientId, @Unread, @Content, @CreateDateTime);";

                    DbUtils.AddParameter(cmd, "@SenderId", message.SenderId);
                    DbUtils.AddParameter(cmd, "@RecipientId", message.RecipientId);
                    DbUtils.AddParameter(cmd, "@Unread", message.Unread);
                    DbUtils.AddParameter(cmd, "@Content", message.Content);
                    DbUtils.AddParameter(cmd, "@CreateDateTime", message.CreateDateTime);

                    message.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

        public int NewMessageCount(int userId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT Count(Id) AS MessageCount
                          FROM UserMessage
                         WHERE RecipientId = @Id AND Unread = 1;";
                    DbUtils.AddParameter(cmd, "@Id", userId);

                    var reader = cmd.ExecuteReader();
                    int messageCount = 0;

                    if (reader.Read())
                    {
                        messageCount = DbUtils.GetInt(reader, "MessageCount");
                    }

                    reader.Close();
                    return messageCount;
                }
            }
        }
    }
}
