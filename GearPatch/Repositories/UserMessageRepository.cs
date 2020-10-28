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
    public class UserMessageRepository : BaseRepository, IUserMessageRepository
    {
        public UserMessageRepository(IConfiguration configuration) : base(configuration) { }

        public List<UserMessage> GetByUser(int currentUserId, int otherUserId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT um.Id, um.SenderId, um.RecipientId, um.Unread, um.Content, um.CreateDateTime

                               sup.LastName AS SenderLastName, sup.FirstName AS SenderFirstName, 
                               sup.ImageLocation AS SenderImageLocation, sup.IsActive AS SenderIsActive
                               
                               rup.LastName AS RecipientLastName, rup.FirstName AS RecipientFirstName, 
                               rup.ImageLocation AS RecipientImageLocation, rup.IsActive AS RecipientIsActive
                               
                          FROM UserMessage um
                     LEFT JOIN UserProfile sup ON sup.Id = um.SenderId
                     LEFT JOIN UserProfile rup ON rup.Id = um.RecipientId
                         WHERE (SenderId = @CurrentUserId AND RecipientId = @OtherUserId) 
                               OR (SenderId = @OtherUserId AND RecipientId = @CurrentUserId)
                      ORDER BY um.CreateDateTime;";
                    DbUtils.AddParameter(cmd, "@CurrentUserId", currentUserId);
                    DbUtils.AddParameter(cmd, "@OtherUserId", otherUserId);

                    var reader = cmd.ExecuteReader();

                    var messages = new List<UserMessage>();

                    while (reader.Read())
                    {
                        messages.Add(new UserMessage()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            SenderId = DbUtils.GetInt(reader, "SenderId"),
                            Sender = new UserProfile()
                            {
                                Id = DbUtils.GetInt(reader, "SenderId"),
                                FirstName = DbUtils.GetString(reader, "SenderFirstName"),
                                LastName = DbUtils.GetString(reader, "SenderLastName"),
                                ImageLocation = DbUtils.GetString(reader, "SenderImageLocation"),
                                IsActive = DbUtils.GetBool(reader, "SenderIsActive")
                            },
                            RecipientId = DbUtils.GetInt(reader, "RecipientId"),
                            Recipient = new UserProfile()
                            {
                                Id = DbUtils.GetInt(reader, "RecipientId"),
                                FirstName = DbUtils.GetString(reader, "RecipientFirstName"),
                                LastName = DbUtils.GetString(reader, "RecipientLastName"),
                                ImageLocation = DbUtils.GetString(reader, "RecipientImageLocation"),
                                IsActive = DbUtils.GetBool(reader, "RecipientIsActive")
                            },

                            Unread = DbUtils.GetBool(reader, "Unread"),
                            Content = DbUtils.GetString(reader, "Content"),
                            CreateDateTime = DbUtils.GetDateTime(reader, "CreateDateTime")
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

	                           lm.MessageId AS LastMessageId, lm.MessageContent AS LastMessageContent, lm.SenderId AS LastMessageSenderId, 
	                           lm.RecipientId AS LastMessageRecipientId, lm.MessageCreateDateTime AS LastMessageDateTime,
                         
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

                          JOIN (SELECT um.Id AS MessageId, um.Content AS MessageContent, um.SenderId AS SenderId, um.RecipientId, um.CreateDateTime AS MessageCreateDateTime
		                          FROM UserMessage um
		                          JOIN (SELECT OtherPartyMax.OtherPartyId, MAX(CreateDateTime) AS LastMessage
				                          FROM (SELECT RecipientId AS OtherPartyId, MAX(CreateDateTime) AS CreateDateTime
				                          FROM UserMessage
				                          WHERE SenderId = @Id
				                          GROUP BY RecipientId
				                      UNION ALL
				                         SELECT SenderId AS OtherPartyId, MAX(CreateDateTime) AS CreateDateTime
				                           FROM UserMessage
				                          WHERE RecipientId = @Id
				                          GROUP BY SenderId) OtherPartyMax
			                    GROUP BY OtherPartyMax.OtherPartyId) opm
		                               ON (um.SenderId = opm.OtherPartyId OR um.RecipientId = opm.OtherPartyId) AND um.CreateDateTime = opm.LastMessage) lm
                               ON msg.OtherParty = lm.RecipientId OR msg.OtherParty = lm.SenderId
                       
                     LEFT JOIN UserProfile up ON up.Id = msg.OtherParty
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
                            LastMessage = new UserMessage()
                            {
                                Id = DbUtils.GetInt(reader, "LastMessageId"),
                                SenderId = DbUtils.GetInt(reader, "LastMessageSenderId"),
                                RecipientId = DbUtils.GetInt(reader, "LastMessageRecipientId"),
                                Content = DbUtils.GetString(reader, "LastMessageContent"),
                                CreateDateTime = DbUtils.GetDateTime(reader, "LastMessageDateTime")
                            }
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
