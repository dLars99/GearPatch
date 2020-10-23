USE [GearPatch];
GO

set identity_insert [UserProfile] on
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (1, 'Priscella', 'Lapham', 'plapham0@behance.net', '547-926-4024', 'olmicn5qmvjm06bkkzy3djs8n1ue', 'http://dummyimage.com/135x185.jpg/ff4444/ffffff', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (2, 'Susanna', 'Tudgay', 'studgay1@slashdot.org', '943-761-7253', 'nytatuaq0r003qv5iy6bc75pu3bq', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (3, 'Wally', 'Rossetti', 'wrossetti2@canalblog.com', '347-940-1797', 'uvhtrqo35mrgjye8rvkegrqz7ms2', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (4, 'Dalton', 'Zute', 'dzute3@fotki.com', '690-165-2953', 'fwijy4agn7mgyw238htz6urmujnm', 'http://dummyimage.com/159x155.png/cc0000/ffffff', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (5, 'Isidora', 'Latus', 'ilatus4@dagondesign.com', '208-809-8433', '4cvp789n1ez36w57pgvhpdcvmut4', 'http://dummyimage.com/148x103.png/ff4444/ffffff', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (6, 'Ddene', 'Maase', 'dmaase5@google.es', '500-591-3263', '93dpqx4fv6s0i9ianomj1bma9m0r', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (7, 'Michell', 'MacCarter', 'mmaccarter6@arstechnica.com', '962-664-4651', 'ebgc7p3o9akpp9atvvex8nva5zvk', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (8, 'Malinde', 'Stammer', 'mstammer7@t.co', '540-352-8490', 't1deok0s3z40fllmw96vq85pplsg', null, 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (9, 'Sonya', 'O''Hone', 'sohone8@lycos.com', '662-490-3112', 'p9v69klcuuprulya5278f1gbtqzv', 'http://dummyimage.com/179x130.png/dddddd/000000', 1);
insert into UserProfile (Id, FirstName, LastName, Email, Phone, FirebaseId, ImageLocation, IsActive) values (10, 'Holly', 'Bendley', 'hbendley9@prweb.com', '869-649-4139', 'xmz9hcbuq5oxmqhuezh43x3pfvcd', 'http://dummyimage.com/121x201.png/ff4444/ffffff', 1);
set identity_insert [UserProfile] off

set identity_insert [GearType] on
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (1, 'Falsa Chiggergrape', 'dapibus duis', 'id');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (2, 'Santa Lucia Dwarf Rush', 'nulla suscipit', 'parturient montes');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (3, 'Plains Ironweed', 'in', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (4, 'Yellow Marsh Marigold', 'ut erat', 'faucibus');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (5, 'Giant Rhubarb', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (6, 'Carolina Thelomma Lichen', null, 'duis aliquam');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (7, 'Skinner''s Falsa Foxglove', 'suspendisse', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (8, 'Beck''s Leafcup', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (9, 'Pore Lichen', 'donec', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (10, 'Santa Cruz Sedge', 'nec', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (11, 'Henderson''s Biscuitroot', 'sed', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (12, 'Roundleaf Ragwort', 'laoreet', 'ut volutpat');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (13, 'Swamp-redwood', 'quis', 'imperdiet nullam');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (14, 'Quill Beak Sedge', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (15, 'Tracy''s Pea', null, 'eu');
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (16, 'Fewflower Beggarticks', 'viverra', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (17, 'White-and-yellow-flower Cornlily', 'non', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (18, 'Saxifrage', null, null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (19, 'Spike Lichen', 'vestibulum sit', null);
insert into GearType (Id, Name, FirstOptionName, SecondOptionName) values (20, 'Trans-pecos Sea Lavender', 'pellentesque', null);
set identity_insert [GearType] off

set identity_insert [Gear] on
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (1, 'vel est', 'Dodge', 'Caravan', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 128, 1, 'http://dummyimage.com/247x230.bmp/5fa2dd/ffffff', 5, 5, 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (2, 'diam nam', 'Lexus', 'SC', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 17, 1, 'http://dummyimage.com/191x202.bmp/dddddd/000000', 4, 8, null, 'donec dapibus duis at velit eu est congue elementum');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (3, 'at dolor', 'Mercedes-Benz', 'G55 AMG', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 113, 0, 'http://dummyimage.com/237x135.bmp/dddddd/000000', 3, 15, 'turpis adipiscing lorem vitae mattis nibh ligula nec', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (4, 'eget rutrum', 'Suzuki', 'SJ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 38, 0, 'http://dummyimage.com/157x205.png/5fa2dd/ffffff', 8, 14, 'vel nisl duis ac', 'nam dui proin');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (5, 'lectus', 'Pontiac', 'Daewoo Kalos', null, 290, 1, 'http://dummyimage.com/200x119.png/5fa2dd/ffffff', 3, 2, 'mi', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (6, 'rhoncus sed', 'Nissan', '350Z', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 182, 1, null, 2, 3, 'nisi venenatis tristique fusce congue diam id ornare', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (7, 'in lacus curabitur', 'Nissan', 'Altima', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 168, 1, null, 9, 14, 'non pretium quis lectus suspendisse potenti in eleifend quam', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (8, 'sollicitudin', 'Saab', '900', null, 328, 1, null, 2, 16, 'nisl duis bibendum', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (9, 'hac habitasse platea', 'Saab', '9-5', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 334, 0, 'http://dummyimage.com/107x153.png/ff4444/ffffff', 4, 8, 'adipiscing lorem vitae mattis', 'curae');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (10, 'eu nibh quisque', 'Chevrolet', 'Metro', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 182, 0, null, 6, 13, null, 'ultrices phasellus id sapien in sapien iaculis congue vivamus');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (11, 'nec nisi', 'Honda', 'Civic', null, 261, 1, 'http://dummyimage.com/205x144.jpg/5fa2dd/ffffff', 5, 6, null, null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (12, 'blandit lacinia', 'BMW', '7 Series', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 153, 0, null, 1, 3, 'ipsum primis in', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (13, 'nulla pede', 'Mitsubishi', 'Outlander', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 299, 1, 'http://dummyimage.com/196x223.jpg/5fa2dd/ffffff', 1, 2, 'nisi volutpat eleifend donec ut dolor morbi vel lectus', 'tempor');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (14, 'neque duis bibendum', 'Kia', 'Sportage', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 112, 1, null, 8, 10, 'mauris viverra diam vitae', 'justo eu massa donec dapibus duis at velit eu');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (15, 'nisl aenean lectus', 'Pontiac', 'Sunfire', null, 200, 0, 'http://dummyimage.com/220x163.bmp/cc0000/ffffff', 1, 5, 'leo odio porttitor id consequat in consequat ut nulla sed', null);
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (16, 'tristique in tempus', 'Porsche', '911', null, 369, 0, null, 9, 12, null, 'non lectus aliquam');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (17, 'maecenas tincidunt lacus', 'Volvo', '940', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 82, 0, 'http://dummyimage.com/238x176.bmp/5fa2dd/ffffff', 10, 10, 'morbi non lectus aliquam sit amet diam in magna', 'integer tincidunt');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (18, 'velit id', 'Audi', 'Q7', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 304, 0, null, 8, 15, 'congue risus semper', 'mollis molestie lorem quisque ut erat curabitur gravida nisi');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (19, 'quis odio', 'Pontiac', 'Grand Am', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 258, 1, 'http://dummyimage.com/242x130.bmp/dddddd/000000', 6, 14, 'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum', 'ante ipsum primis');
insert into Gear (id, Headline, Manufacturer, Model, Description, Price, IsActive, ImageLocation, UserProfileId, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (20, 'est et', 'Buick', 'Skylark', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 480, 0, 'http://dummyimage.com/218x136.bmp/5fa2dd/ffffff', 8, 14, 'dolor morbi vel lectus', null);
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
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (2, 9, 7, 47, 170, '12/23/2019', '08/13/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (3, 7, 1, 1, 234, '09/30/2020', '12/29/2019', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (4, 1, 7, 15, 198, '09/18/2020', '08/31/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (5, 3, 6, 41, 214, '10/01/2020', '05/20/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (6, 7, 5, 40, 76, '08/01/2020', '01/31/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (7, 4, 10, 32, 128, '05/16/2020', '01/02/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (8, 3, 1, 42, 82, '10/13/2020', '07/22/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (9, 9, 2, 1, 167, '12/24/2019', '10/26/2019', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (10, 9, 5, 10, 179, '07/26/2020', '06/23/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (11, 7, 3, 20, 77, '08/19/2020', '02/22/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (12, 6, 8, 23, 146, '03/09/2020', '05/14/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (13, 4, 1, 17, 63, '03/02/2020', '12/07/2019', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (14, 1, 8, 37, 101, '11/13/2019', '07/07/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (15, 1, 1, 12, 119, '10/25/2019', '04/01/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (16, 7, 3, 8, 234, '07/10/2020', '07/26/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (17, 2, 4, 50, 248, '12/27/2019', '10/27/2019', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (18, 3, 4, 13, 46, '10/26/2019', '05/15/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (19, 7, 9, 38, 40, '11/23/2019', '05/18/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (20, 9, 2, 41, 103, '06/16/2020', '08/21/2020', 1, 1);
set identity_insert [Reservation] off

set identity_insert [Accessory] on
insert into Accessory (Id, GearId, Name, Description) values (1, 21, 'id', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.');
insert into Accessory (Id, GearId, Name, Description) values (2, 46, 'nisi nam', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
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
insert into Accessory (Id, GearId, Name, Description) values (11, 6, 'nunc', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into Accessory (Id, GearId, Name, Description) values (12, 43, 'mauris sit', null);
insert into Accessory (Id, GearId, Name, Description) values (13, 23, 'a feugiat', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into Accessory (Id, GearId, Name, Description) values (14, 45, 'porttitor lacus', null);
insert into Accessory (Id, GearId, Name, Description) values (15, 15, 'aliquam quis', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into Accessory (Id, GearId, Name, Description) values (16, 37, 'duis', null);
insert into Accessory (Id, GearId, Name, Description) values (17, 45, 'magnis', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into Accessory (Id, GearId, Name, Description) values (18, 12, 'elementum', null);
insert into Accessory (Id, GearId, Name, Description) values (19, 36, 'id', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into Accessory (Id, GearId, Name, Description) values (20, 13, 'odio', null);
insert into Accessory (Id, GearId, Name, Description) values (21, 16, 'erat vestibulum sed', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into Accessory (Id, GearId, Name, Description) values (22, 20, 'et', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into Accessory (Id, GearId, Name, Description) values (23, 36, 'aliquam convallis nunc', null);
insert into Accessory (Id, GearId, Name, Description) values (24, 40, 'faucibus orci luctus', null);
insert into Accessory (Id, GearId, Name, Description) values (25, 42, 'at velit', null);
set identity_insert [Accessory] off

set identity_insert [Message] on
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (1, 4, 7, 0, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (2, 5, 9, 1, 'In hac habitasse platea dictumst.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (3, 7, 5, 0, 'Morbi non lectus.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (4, 2, 9, 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (5, 8, 1, 1, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (6, 7, 6, 0, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (7, 9, 8, 0, 'Vivamus tortor.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (8, 7, 9, 1, 'Proin eu mi. Nulla ac enim.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (9, 4, 9, 1, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (10, 4, 9, 1, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (11, 1, 7, 0, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (12, 4, 8, 0, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (13, 6, 4, 1, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (14, 7, 2, 1, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (15, 8, 7, 0, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (16, 3, 7, 1, 'Etiam faucibus cursus urna.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (17, 5, 4, 0, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (18, 1, 5, 1, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (19, 2, 1, 0, 'Praesent blandit.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (20, 4, 2, 1, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (21, 5, 9, 1, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (22, 4, 2, 0, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (23, 2, 8, 1, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (24, 1, 4, 1, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (25, 1, 8, 1, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
set identity_insert [Message] off