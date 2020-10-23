USE [master]

IF db_id('GearPatch') IS NULL
  CREATE DATABASE [GearPatch]
GO

USE [GearPatch]
GO


DROP TABLE IF EXISTS [GearImages];
DROP TABLE IF EXISTS [GearReview];
DROP TABLE IF EXISTS [OwnerReview];
DROP TABLE IF EXISTS [CustomerReview];
DROP TABLE IF EXISTS [Reservation];
DROP TABLE IF EXISTS [Accessory];
DROP TABLE IF EXISTS [Gear];
DROP TABLE IF EXISTS [GearType];
DROP TABLE IF EXISTS [Message];
DROP TABLE IF EXISTS [UserProfile];
GO


CREATE TABLE [UserProfile] (
  [Id] integer PRIMARY KEY IDENTITY,
  [FirstName] nvarchar(40) NOT NULL,
  [LastName] nvarchar(40) NOT NULL,
  [Email] nvarchar(255) NOT NULL,
  [Phone] nvarchar(20) NOT NULL,
  [FirebaseId] nvarchar(28) NOT NULL,
  [ImageLocation] nvarchar(255),
  [IsActive] bit NOT NULL,

  CONSTRAINT UQ_FirebaseId UNIQUE(FirebaseId)
)


CREATE TABLE [GearType] (
  [Id] integer PRIMARY KEY IDENTITY,
  [Name] nvarchar(50) NOT NULL,
  [FirstOptionName] nvarchar(50),
  [SecondOptionName] nvarchar(50)
)


CREATE TABLE [Gear] (
  [Id] integer PRIMARY KEY IDENTITY,
  [UserProfileId] integer NOT NULL,
  [Headline] nvarchar(50) NOT NULL,
  [Manufacturer] nvarchar(40) NOT NULL,
  [Model] nvarchar(40) NOT NULL,
  [Description] nvarchar(max),
  [Price] integer NOT NULL,
  [IsActive] bit NOT NULL,
  [GearTypeId] integer NOT NULL,
  [ImageLocation] nvarchar(255),
  [FirstOptionNotes] nvarchar(255),
  [SecondOptionNotes] nvarchar(255),

  CONSTRAINT [FK_Gear_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id]),
  CONSTRAINT [FK_Gear_GearType] FOREIGN KEY ([GearTypeId]) REFERENCES [GearType] ([Id])
)


CREATE TABLE [GearImages] (
  [Id] integer PRIMARY KEY IDENTITY,
  [GearId] integer NOT NULL,
  [ImageLocation] nvarchar(255) NOT NULL
)


CREATE TABLE [Reservation] (
  [Id] integer PRIMARY KEY IDENTITY,
  [OwnerId] integer NOT NULL,
  [CustomerId] integer NOT NULL,
  [GearId] integer NOT NULL,
  [AgreedPrice] integer NOT NULL,
  [StartDate] datetime NOT NULL,
  [EndDate] datetime NOT NULL,
  [Confirmed] bit NOT NULL,
  [ItemReturned] bit NOT NULL,

  CONSTRAINT [FK_Reservation_UserProfile_Owner] FOREIGN KEY ([OwnerId])
	REFERENCES [UserProfile] ([Id]),

  CONSTRAINT [FK_Reservation_UserProfile_Customer] FOREIGN KEY ([CustomerId])
	REFERENCES [UserProfile] ([Id]),

  CONSTRAINT [FK_Reservation_Gear] FOREIGN KEY ([GearId]) REFERENCES [Gear] ([Id])
)


CREATE TABLE [GearReview] (
  [Id] integer PRIMARY KEY IDENTITY,
  [GearId] integer NOT NULL,
  [ReservationId] integer NOT NULL,
  [Rating] integer NOT NULL,
  [Details] nvarchar(500),

  CONSTRAINT [FK_GearReview_Gear] FOREIGN KEY ([GearId])
	REFERENCES [Gear] ([Id]),

  CONSTRAINT [FK_GearReview_Reservation] FOREIGN KEY ([ReservationId])
	REFERENCES [Reservation] ([Id]),

)


CREATE TABLE [OwnerReview] (
  [Id] integer PRIMARY KEY IDENTITY,
  [UserProfileId] integer NOT NULL,
  [ReservationId] integer NOT NULL,
  [Rating] integer NOT NULL,
  [Details] nvarchar(500),
    
  CONSTRAINT [FK_OwnerReview_UserProfile] FOREIGN KEY ([UserProfileId])
	REFERENCES [UserProfile] ([Id]),

  CONSTRAINT [FK_OwnerReview_Reservation] FOREIGN KEY ([ReservationId])
	REFERENCES [Reservation] ([Id]),

)


CREATE TABLE [CustomerReview] (
  [Id] integer PRIMARY KEY IDENTITY,
  [UserProfileId] integer NOT NULL,
  [ReservationId] integer NOT NULL,
  [Rating] integer NOT NULL,
  [Details] nvarchar(500),
    
  CONSTRAINT [FK_CustomerReview] FOREIGN KEY ([UserProfileId])
	REFERENCES [UserProfile] ([Id]),

  CONSTRAINT [FK_CustomerReview_Reservation] FOREIGN KEY ([ReservationId])
	REFERENCES [Reservation] ([Id]),

)


CREATE TABLE [Accessory] (
  [Id] integer PRIMARY KEY IDENTITY,
  [GearId] integer NOT NULL,
  [Name] nvarchar(50) NOT NULL,
  [Description] nvarchar(500),

  CONSTRAINT [FK_Accessory_Gear] FOREIGN KEY ([GearId]) REFERENCES [Gear] ([Id])
)


CREATE TABLE [Message] (
  [Id] integer PRIMARY KEY IDENTITY,
  [SenderId] integer NOT NULL,
  [RecipientId] integer NOT NULL,
  [Unread] bit NOT NULL,
  [Content] nvarchar(1000) NOT NULL,

  CONSTRAINT [FK_Message_UserProfile_Sender] FOREIGN KEY ([SenderId])
	REFERENCES [UserProfile] ([Id]),

  CONSTRAINT [FK_Reservation_UserProfile_Recipient] FOREIGN KEY ([RecipientId])
	REFERENCES [UserProfile] ([Id])
)
GO