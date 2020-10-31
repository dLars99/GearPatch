USE [GearPatch];
GO

set identity_insert [UserProfile] on
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (1, 'Inactive', 'User', 'xxx@xxx.com', '123-456-7890', 'abc', 'abcdefghijklmnopqrstuvwxyz12', null, 0);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (2, 'Henry', 'McHenry', 'test@test.com', '547-926-4024', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', '3XfPRAy0WOPKaNZnBUbRNdEIWut1', 'guitar-musical-instruments-gear.jpg', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (3, 'Susanna', 'Tudgay', 'user2@test.com', '943-761-7253', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', '4cvp789n1ez36w57pgvhpdcvm321', 'girl-guitar.png', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (4, 'Dalton', 'Zute', 'user3@test.com', '690-165-2953', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', 'fwijy4agn7mgyw238htz6urmujnm', 'live-singer.jpg', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (5, 'Isidora', 'Latus', 'user4@test.com', '208-809-8433', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', '4cvp789n1ez36w57pgvhpdcvmut4', 'piano-mixer.jpg', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (6, 'Ddene', 'Maase', 'user6@test.com', '500-591-3263', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', '93dpqx4fv6s0i9ianomj1bma9m0r', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (7, 'Michell', 'MacCarter', 'user7@test.com', '962-664-4651', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', 'ebgc7p3o9akpp9atvvex8nva5zvk', 'marchingdrum.jpg', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (8, 'Malinde', 'Stammer', 'user8@test.com', '540-352-8490', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', 't1deok0s3z40fllmw96vq85pplsg', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (9, 'Sonya', 'O''Hone', 'user9@test.com', '662-490-3112', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', 'p9v69klcuuprulya5278f1gbtqzv', 'stagedrum.jpg', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, Bio, FirebaseId, ImageLocation, IsActive) values (10, 'Holly', 'Bendley', 'user10@test.com', '869-649-4139', 'I am the very model of a modern Major-General. I''ve information vegetable, animal, and mineral. I know the kings of England, and I quote the fights historical, from Marathon to Waterloo, in order categorical. I''m very well acquainted too with matters mathematical. I understand equations, both the simple and quadratical. About binomial theorem I''m teeming with a lot o'' news with many cheerful facts about the square of the hypotenuse', 'xmz9hcbuq5oxmqhuezh43x3pfvcd', 'guitars.jpg', 1);
set identity_insert [UserProfile] off

set identity_insert [GearType] on
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (1, 'Electric Guitar', 'String gauge', 'String condition');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (2, 'Acoustic Guitar', 'String gauge', 'String condition');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (3, 'Electric Bass', 'Number of strings', 'String condition');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (4, 'Upright bass', 'String condition', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (5, 'Drum Set', 'Number of Pieces', 'Head condition');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (6, 'Cymbal', 'Size', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (7, 'Keyboard', 'Number of keys', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (8, 'Trumpet', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (9, 'Trombone', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (10, 'Saxophone', 'Range (soprano, tenor, etc.)', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (11, 'Microphone', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (12, 'Audio interface', 'Number of inputs', 'Type of connection (Firewire, USB3, etc.)');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (13, 'PA Head', 'Number of channels', 'Powered (yes/no)');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (14, 'Mixing board', 'Number of channels', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (15, 'Speaker', 'Cone size in inches', 'Output power in watts');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (16, 'Studio monitor speaker', 'Cone size in inches', 'Output power in watts');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (17, 'Drum, individual', 'Type (snare, tom, etc.)', 'Size');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (18, 'Violin/fiddle', 'Bow included (yes/no)', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (19, 'Cello', 'Bow included (yes/no)', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (20, 'Stage monitor speaker', 'Cone size in inches', 'Output power in watts');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (21, 'Other', 'Specify Item', null);
set identity_insert [GearType] off

set identity_insert [Gear] on
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (1, 'Unavailable', 'This item', 'is no longer available', 'Unavailable', 1, 0, null, 1, 1, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (2, 'Shiny trumpet!', 'Bach', 'Stradivarius 37', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 79, 1, 'bachstrad.jpg', 4, 8, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (3, 'Old, reliable speaker', 'Yamaha', 'BR-12', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 55, 0, 'br112.jpg', 3, 15, '12', 300);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (4, 'Great little mixer', 'Yamaha', 'EMX 5016', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 99, 1, 'YAM-EMX5016CF_E.jpg', 8, 14, '16', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (5, 'Gorgeous guitar for careful renters', 'Taylor', '814ce', null, 127, 1, '814ce.jpg', 3, 2, '12', 'I put new strings on each time');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (6, 'MONSTER!!!', 'Musicman', 'bongo', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 150, 1, null, 2, 3, '5', 'good');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (7, 'Portable', 'Mackie', 'FX16', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 88, 1, 'mackiemixer.jpg', 9, 14, '16', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (8, 'Monitors', 'KRK', 'R6', null, 39, 1, null, 2, 16, '6', 'i don''t know');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (9, 'Great horn for rent!', 'Eclipse', 'MR', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 334, 1, 'eclipse-mr-trumpet.jpg', 4, 8, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (10, 'My loss is your gain', 'Yamaha', 'EMX 68s', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 182, 0, 'yamaha-emx68s-17923.jpg', 6, 13, '6', 'yes');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (11, 'Let er ring!', 'Zildjian', 'DCP Ride', null, 80, 1, 'zil-player-1_1.jpg', 5, 6, '20', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (12, 'The Standard', 'Fender', 'P-Bass', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 129, 1, null, 2, 3, '4', 'roundwound');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (13, 'Acoustic guitar', 'Yamaha', 'FG-403S', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 75, 1, 'yamaha-acoustic.jpg', 8, 2, '13', 'tuned');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (14, 'Professionally cleaned every time', 'P. Mauriat', 'System-76 Tenor', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 225, 1, 'p-maruiat-76.jpg', 8, 10, 'tenor', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (15, 'will deliver!', 'tama', 'starclassic', null, 399, 0, 'starclassic.jpg', 1, 5, '5', 'changed as needed');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (16, 'clean and reliable', 'presonus', 'quantum', null, 425, 0, null, 9, 12, '26', 'thunderbolt');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (17, 'Sleek, sexy sax', 'Selmer', '52JBL Series II', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 499, 1, 'blacksax.jpg', 10, 10, 'Tenor', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (18, 'Set of Two JBL Speakers for your gig', 'JBL', 'MP215', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 50, 1, 'jbl-mp215.jpg', 8, 15, '16', '250');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (19, 'The best mic you''ll ever use', 'Royer', 'R-121', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 256, 1, 'r121.jpg', 6, 11, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (20, 'Gets the job done!', 'Behringer', 'QX1832USB', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 480, 0, 'http://dummyimage.com/218x136.bmp/5fa2dd/ffffff', 8, 14, '14', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (21, 'luctus', 'Audi', '90', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 243, 0, null, 1, 11, 'sem praesent', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (22, 'semper interdum mauris', 'Mercedes-Benz', 'C-Class', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 273, 1, 'http://dummyimage.com/170x114.jpg/ff4444/ffffff', 4, 7, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (23, 'nulla', 'Ford', 'F-Series', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 379, 1, 'http://dummyimage.com/226x227.jpg/ff4444/ffffff', 9, 5, 'accumsan felis ut at', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (24, 'sapien sapien', 'Dodge', 'Avenger', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 236, 1, 'http://dummyimage.com/123x210.bmp/ff4444/ffffff', 6, 14, 'quis tortor id nulla ultrices aliquet maecenas leo', 'ut nulla sed accumsan felis ut');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (25, 'duis', 'Maserati', 'Spyder', null, 236, 0, 'http://dummyimage.com/137x124.bmp/5fa2dd/ffffff', 8, 12, 'eget elit sodales scelerisque mauris sit amet eros suspendisse', 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (26, 'blandit non interdum', 'Infiniti', 'QX', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 234, 1, 'http://dummyimage.com/107x111.bmp/ff4444/ffffff', 7, 19, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (27, 'in lectus', 'Kia', 'Rio', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 33, 1, null, 5, 6, 'tempor convallis nulla', 'natoque penatibus');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (28, 'phasellus in', 'Ford', 'Mustang', null, 8, 0, null, 8, 12, null, 'orci eget orci vehicula condimentum curabitur in libero ut');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (29, 'suspendisse potenti in', 'Mitsubishi', 'Tredia', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 51, 0, 'http://dummyimage.com/126x168.png/5fa2dd/ffffff', 5, 17, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (30, 'morbi non', 'Toyota', 'Tundra', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 5, 1, 'http://dummyimage.com/130x128.png/cc0000/ffffff', 2, 3, 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (31, 'eu', 'Audi', 'Allroad', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 256, 0, 'http://dummyimage.com/226x108.png/dddddd/000000', 4, 7, 'habitasse platea dictumst aliquam augue quam', 'hac habitasse platea dictumst aliquam');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (32, 'interdum in', 'Nissan', 'Murano', null, 90, 0, null, 2, 3, 'id mauris vulputate elementum nullam varius nulla facilisi', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (33, 'turpis integer aliquet', 'Dodge', 'Ram Wagon B250', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 444, 0, 'http://dummyimage.com/111x181.bmp/dddddd/000000', 10, 10, 'nulla eget eros elementum pellentesque quisque porta', 'nulla sed vel');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (34, 'rutrum nulla tellus', 'Chevrolet', 'Express 3500', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 361, 0, null, 4, 17, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (35, 'justo sollicitudin ut', 'Nissan', 'GT-R', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 65, 0, 'http://dummyimage.com/239x235.bmp/cc0000/ffffff', 4, 10, 'cras non velit nec nisi vulputate nonummy maecenas tincidunt', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (36, 'sapien', 'Ford', 'Explorer', null, 249, 1, 'http://dummyimage.com/207x140.png/5fa2dd/ffffff', 1, 2, null, 'duis aliquam convallis nunc proin at');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (37, 'posuere cubilia', 'Lexus', 'GS', null, 53, 1, 'http://dummyimage.com/207x156.jpg/dddddd/000000', 4, 16, 'donec semper sapien a libero nam', 'vel est donec odio justo sollicitudin ut suscipit');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (38, 'sed interdum venenatis', 'Volkswagen', 'Jetta', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 127, 1, 'http://dummyimage.com/139x218.png/ff4444/ffffff', 2, 16, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (39, 'tellus', 'BMW', '7 Series', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 166, 0, null, 3, 17, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (40, 'nunc', 'Suzuki', 'Grand Vitara', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 290, 0, null, 9, 3, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (41, 'donec semper', 'Aston Martin', 'Vanquish S', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 22, 0, null, 10, 10, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (42, 'maecenas ut massa', 'Mazda', 'Familia', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 182, 1, null, 4, 6, null, 'nam ultrices libero non mattis');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (43, 'eget eros', 'Hyundai', 'Santa Fe', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 458, 0, 'http://dummyimage.com/177x133.bmp/cc0000/ffffff', 5, 14, 'habitasse platea dictumst aliquam augue', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (44, 'viverra eget congue', 'Ford', 'Ranger', null, 90, 1, null, 7, 14, 'montes', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (45, 'rutrum at', 'BMW', 'Alpina B7', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 5, 1, null, 3, 19, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (46, 'interdum eu tincidunt', 'Dodge', 'Charger', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 15, 0, null, 2, 16, 'rutrum neque aenean auctor gravida', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (47, 'phasellus id sapien', 'Oldsmobile', 'Achieva', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 99, 1, null, 9, 16, 'nibh fusce lacus purus aliquet at feugiat non', 'vehicula consequat morbi a ipsum integer a nibh');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (48, 'sociis natoque penatibus', 'Chevrolet', 'Silverado 1500', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 467, 0, 'http://dummyimage.com/114x204.bmp/cc0000/ffffff', 9, 4, 'at turpis donec posuere metus vitae', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (49, 'tincidunt eu felis', 'Toyota', 'MR2', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 271, 0, 'http://dummyimage.com/189x133.bmp/5fa2dd/ffffff', 2, 10, 'ac nibh fusce lacus purus aliquet at feugiat', 'vestibulum rutrum');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (50, 'tempus semper', 'Audi', 'TT', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 129, 0, null, 2, 15, 'elementum ligula vehicula consequat morbi', 'neque duis bibendum morbi');

set identity_insert [Gear] off

set identity_insert [GearImages] on
insert into GearImages (Id, GearId, ImageLocation) values (1, 26, 'http://dummyimage.com/186x141.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (2, 41, 'http://dummyimage.com/161x141.bmp/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (3, 26, 'http://dummyimage.com/162x119.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (4, 21, 'http://dummyimage.com/239x246.jpg/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (5, 1, 'http://dummyimage.com/200x156.jpg/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (6, 32, 'http://dummyimage.com/120x101.png/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (7, 24, 'http://dummyimage.com/182x157.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (8, 20, 'http://dummyimage.com/179x154.bmp/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (9, 13, 'http://dummyimage.com/223x233.png/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (10, 35, 'http://dummyimage.com/205x216.png/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (11, 47, 'http://dummyimage.com/126x231.jpg/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (12, 33, 'http://dummyimage.com/225x237.png/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (13, 26, 'http://dummyimage.com/161x155.png/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (14, 20, 'http://dummyimage.com/207x127.jpg/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (15, 27, 'http://dummyimage.com/159x137.bmp/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (16, 50, 'http://dummyimage.com/226x180.jpg/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (17, 21, 'http://dummyimage.com/111x160.bmp/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (18, 18, 'http://dummyimage.com/202x236.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (19, 24, 'http://dummyimage.com/113x241.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (20, 41, 'http://dummyimage.com/196x174.png/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (21, 48, 'http://dummyimage.com/102x164.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (22, 13, 'http://dummyimage.com/131x150.png/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (23, 50, 'http://dummyimage.com/147x158.png/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (24, 36, 'http://dummyimage.com/244x105.bmp/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (25, 43, 'http://dummyimage.com/225x156.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (26, 14, 'http://dummyimage.com/201x121.jpg/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (27, 33, 'http://dummyimage.com/162x115.jpg/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (28, 41, 'http://dummyimage.com/198x181.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (29, 19, 'http://dummyimage.com/231x234.jpg/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (30, 20, 'http://dummyimage.com/247x138.jpg/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (31, 38, 'http://dummyimage.com/224x107.png/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (32, 42, 'http://dummyimage.com/106x215.jpg/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (33, 27, 'http://dummyimage.com/123x175.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (34, 21, 'http://dummyimage.com/198x227.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (35, 14, 'http://dummyimage.com/125x107.bmp/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (36, 22, 'http://dummyimage.com/149x240.png/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (37, 23, 'http://dummyimage.com/193x237.bmp/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (38, 12, 'http://dummyimage.com/135x176.png/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (39, 14, 'http://dummyimage.com/143x198.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (40, 50, 'http://dummyimage.com/186x128.jpg/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (41, 10, 'http://dummyimage.com/170x242.jpg/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (42, 39, 'http://dummyimage.com/115x106.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (43, 30, 'http://dummyimage.com/152x198.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (44, 38, 'http://dummyimage.com/244x145.jpg/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (45, 10, 'http://dummyimage.com/216x224.jpg/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (46, 12, 'http://dummyimage.com/238x138.png/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (47, 16, 'http://dummyimage.com/112x226.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (48, 37, 'http://dummyimage.com/126x190.bmp/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (49, 32, 'http://dummyimage.com/190x162.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (50, 17, 'http://dummyimage.com/204x217.jpg/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (51, 46, 'http://dummyimage.com/135x185.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (52, 25, 'http://dummyimage.com/212x227.png/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (53, 31, 'http://dummyimage.com/240x152.bmp/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (54, 11, 'http://dummyimage.com/139x112.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (55, 50, 'http://dummyimage.com/169x109.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (56, 41, 'http://dummyimage.com/145x178.bmp/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (57, 24, 'http://dummyimage.com/161x176.bmp/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (58, 6, 'http://dummyimage.com/128x113.jpg/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (59, 42, 'http://dummyimage.com/182x175.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (60, 39, 'http://dummyimage.com/225x112.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (61, 40, 'http://dummyimage.com/220x169.jpg/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (62, 45, 'http://dummyimage.com/227x156.png/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (63, 38, 'http://dummyimage.com/225x166.jpg/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (64, 10, 'http://dummyimage.com/159x144.png/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (65, 19, 'http://dummyimage.com/198x143.png/5fa2dd/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (66, 36, 'http://dummyimage.com/150x101.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (67, 11, 'http://dummyimage.com/105x154.png/cc0000/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (68, 20, 'http://dummyimage.com/240x225.jpg/ff4444/ffffff');
insert into GearImages (Id, GearId, ImageLocation) values (69, 4, 'http://dummyimage.com/136x117.png/dddddd/000000');
insert into GearImages (Id, GearId, ImageLocation) values (70, 5, 'http://dummyimage.com/201x133.bmp/ff4444/ffffff');
set identity_insert [GearImages] off

set identity_insert [Reservation] on
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (1, 4, 6, 5, 233, '05/02/2020', '03/02/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (2, 9, 7, 47, 170, '12/23/2019', '08/13/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (3, 7, 2, 3, 234, '10/30/2020', '11/02/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (4, 2, 7, 15, 198, '09/18/2020', '09/25/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (5, 3, 6, 41, 214, '10/01/2020', '05/20/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (6, 7, 5, 40, 76, '08/01/2020', '01/31/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (7, 4, 10, 32, 128, '05/16/2020', '01/02/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (8, 3, 2, 42, 82, '10/13/2020', '10/22/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (9, 9, 2, 1, 167, '12/24/2019', '01/02/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (10, 9, 5, 10, 179, '07/26/2020', '06/23/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (11, 7, 3, 20, 77, '08/19/2020', '02/22/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (12, 6, 8, 23, 146, '03/09/2020', '05/14/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (13, 4, 2, 17, 63, '03/02/2020', '03/07/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (14, 2, 8, 37, 101, '11/13/2019', '11/14/2019', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (15, 2, 10, 12, 119, '10/31/2020', '11/05/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (16, 7, 3, 8, 234, '07/10/2020', '07/26/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (17, 2, 4, 50, 248, '12/27/2019', '01/02/2019', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (18, 3, 4, 13, 46, '10/26/2019', '05/15/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (19, 7, 9, 38, 40, '11/23/2019', '05/18/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (20, 9, 2, 41, 103, '06/16/2020', '06/21/2020', 1, 1);
set identity_insert [Reservation] off

set identity_insert [Accessory] on
insert into Accessory (Id, GearId, Name, Description) values (1, 21, 'id', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.');
insert into Accessory (Id, GearId, Name, Description) values (2, 46, 'nisi nam', 'nice padded strap');
insert into Accessory (Id, GearId, Name, Description) values (3, 38, 'nascetur', null);
insert into Accessory (Id, GearId, Name, Description) values (4, 45, 'pellentesque ultrices', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into Accessory (Id, GearId, Name, Description) values (5, 49, 'sapien', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into Accessory (Id, GearId, Name, Description) values (6, 41, 'lacinia nisi venenatis', null);
insert into Accessory (Id, GearId, Name, Description) values (7, 43, 'sagittis sapien cum', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.');
insert into Accessory (Id, GearId, Name, Description) values (8, 26, 'amet', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into Accessory (Id, GearId, Name, Description) values (9, 26, 'neque duis', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into Accessory (Id, GearId, Name, Description) values (10, 28, 'lorem integer', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into Accessory (Id, GearId, Name, Description) values (11, 6, 'Strap', 'Nice padded strap');
insert into Accessory (Id, GearId, Name, Description) values (12, 43, 'mauris sit', null);
insert into Accessory (Id, GearId, Name, Description) values (13, 23, 'a feugiat', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into Accessory (Id, GearId, Name, Description) values (14, 45, 'porttitor lacus', null);
insert into Accessory (Id, GearId, Name, Description) values (15, 15, 'hardware', 'everything you could need, hi hat stand, three cymmbal stands, ride, crash, china, kick petal, snare stand, all mounts, great deal, you get everything!');
insert into Accessory (Id, GearId, Name, Description) values (16, 37, 'duis', null);
insert into Accessory (Id, GearId, Name, Description) values (17, 45, 'magnis', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into Accessory (Id, GearId, Name, Description) values (18, 12, 'Hardshell case', null);
insert into Accessory (Id, GearId, Name, Description) values (19, 36, 'id', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into Accessory (Id, GearId, Name, Description) values (20, 13, 'Gig bag', null);
insert into Accessory (Id, GearId, Name, Description) values (21, 16, 'Power adaptar', 'Included power adapter');
insert into Accessory (Id, GearId, Name, Description) values (22, 20, 'Power cable', 'You can''t use the board without power! Must be returned with the power cable, or else I will not mark the return!');
insert into Accessory (Id, GearId, Name, Description) values (23, 36, 'aliquam convallis nunc', null);
insert into Accessory (Id, GearId, Name, Description) values (24, 40, 'faucibus orci luctus', null);
insert into Accessory (Id, GearId, Name, Description) values (25, 42, 'at velit', null);
set identity_insert [Accessory] off

set identity_insert [UserMessage] on
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (1, 10, 2, '2019-05-15 03:37:58', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (2, 9, 5, '2020-03-15 02:46:46', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (3, 8, 9, '2020-03-06 23:56:53', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (4, 10, 2, '2020-10-07 23:14:47', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (5, 4, 7, '2019-09-23 04:41:54', 'Ut at dolor quis odio consequat varius. Integer ac leo.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (6, 8, 8, '2020-07-23 17:44:11', 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (7, 5, 2, '2020-03-12 18:22:19', 'Does it include the stand?', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (8, 8, 2, '2019-11-20 05:29:55', 'I''m so grateful for this, I''m really in a bind! Do you have a cable you can throw in? I''ll slip you a fiver for it if you do. ', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (9, 5, 2, '2020-07-15 04:50:34', 'I really, really need this for a live video shoot and mine is in the shop! Are you cool with it being out of town, travelling for a week? Let me know!', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (10, 2, 9, '2019-09-01 09:51:14', 'Can you give me any more detail about the item? How well is it maintained? I want to make sure it sounds great for a recording gig.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (11, 3, 6, '2020-03-09 05:50:47', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (12, 2, 6, '2019-06-23 15:28:28', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (13, 3, 3, '2019-05-27 10:42:58', 'Nulla justo.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (14, 4, 7, '2020-03-15 13:08:41', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (15, 8, 2, '2019-11-30 16:21:52', 'Thank you again for the rental! It really saved me!', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (16, 2, 8, '2019-07-26 22:07:10', 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (17, 4, 3, '2020-08-28 04:01:33', 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (18, 3, 2, '2020-10-20 02:48:06', 'This worked great for me overall, but I had some trouble keeping the D string in tune. The tuner feels a little loose, you may want to get that looked at.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (19, 4, 10, '2019-04-13 19:54:35', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (20, 7, 10, '2020-10-04 21:34:45', 'Nulla tellus.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (21, 7, 4, '2019-06-17 15:26:56', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (22, 4, 10, '2019-12-29 06:01:38', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 1);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (23, 9, 5, '2019-12-31 05:48:37', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (24, 4, 5, '2020-06-22 13:50:32', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 0);
insert into UserMessage (Id, SenderId, RecipientId, CreateDateTime, Content, Unread) values (25, 9, 2, '2019-04-30 20:02:10', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 1);
set identity_insert [UserMessage] off