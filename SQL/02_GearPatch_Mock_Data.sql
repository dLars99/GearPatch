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
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (1, 2, 'a ipsum integer a nibh', 'Ford', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 133, 1, 9, 'volutpat convallis morbi odio odio elementum eu interdum', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (2, 1, 'penatibus', 'Infiniti', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 363, 0, 14, 'ultrices aliquet maecenas', 'ut nunc vestibulum ante ipsum primis');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (3, 1, null, 'Mercedes-Benz', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 349, 0, 15, 'semper', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (4, 3, 'quam pharetra magna ac', 'Toyota', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 135, 0, 18, 'potenti cras in purus eu magna vulputate luctus cum', 'convallis duis consequat dui nec nisi volutpat eleifend donec ut');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (5, 1, 'morbi ut odio cras', 'Chevrolet', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 133, 0, 18, null, null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (6, 2, 'vel enim sit', 'Honda', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 189, 0, 2, 'dolor sit amet consectetuer adipiscing elit proin interdum', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (7, 3, 'sem mauris laoreet ut', 'Dodge', null, 398, 0, 6, 'morbi vel lectus in quam fringilla', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (8, 3, 'habitasse platea dictumst morbi vestibulum', 'Mazda', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 199, 1, 1, 'nunc commodo placerat praesent blandit nam nulla integer pede justo', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (9, 3, 'nunc nisl duis', 'Ford', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 276, 0, 6, null, null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (10, 4, null, 'Toyota', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 260, 0, 1, 'pretium iaculis diam', 'montes nascetur ridiculus mus etiam');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (11, 1, null, 'Maybach', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 244, 0, 18, 'dis parturient', 'odio elementum eu interdum');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (12, 1, 'nulla eget eros elementum', 'Volkswagen', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 119, 1, 13, 'diam cras pellentesque', 'quam nec dui luctus rutrum nulla tellus in');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (13, 4, null, 'Audi', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 249, 0, 16, 'molestie sed justo pellentesque viverra pede ac', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (14, 1, 'eleifend luctus ultricies eu nibh', 'Aston Martin', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 34, 0, 18, 'sit amet consectetuer adipiscing elit proin risus', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (15, 1, null, 'Ford', null, 5, 0, 4, 'mi in porttitor pede justo eu massa', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (16, 2, null, 'Honda', null, 219, 1, 11, 'justo sollicitudin', 'massa');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (17, 2, null, 'Mercury', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 5, 1, 19, 'ultrices mattis odio donec vitae nisi nam ultrices libero', 'massa quis augue luctus tincidunt nulla mollis');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (18, 4, 'vestibulum', 'Chevrolet', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 229, 0, 2, 'nunc nisl', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (19, 1, 'nisl', 'Chevrolet', null, 219, 0, 1, null, 'tempus semper est');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (20, 1, 'quis tortor', 'Lexus', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 177, 1, 10, 'eu nibh quisque id', 'faucibus orci luctus et ultrices');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (21, 4, 'maecenas tincidunt lacus at velit', 'Mercedes-Benz', null, 328, 1, 16, 'lobortis ligula sit amet eleifend', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (22, 1, null, 'Cadillac', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 180, 1, 12, 'sed accumsan felis ut at dolor quis odio consequat', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (23, 4, null, 'Dodge', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 240, 0, 12, 'non mattis pulvinar nulla pede ullamcorper augue', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (24, 3, 'vulputate ut ultrices', 'Lexus', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 93, 1, 18, 'pellentesque', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (25, 4, 'ipsum primis', 'Buick', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 333, 0, 7, null, 'in blandit ultrices');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (26, 2, 'penatibus et magnis', 'Honda', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 90, 1, 10, 'libero non mattis pulvinar', 'ultrices posuere cubilia curae mauris viverra diam vitae');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (27, 4, null, 'Mercedes-Benz', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 399, 0, 2, 'ac consequat metus sapien', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (28, 2, 'elementum nullam varius nulla', 'Chevrolet', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 69, 1, 4, 'mi', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (29, 5, 'convallis duis consequat dui nec', 'Saab', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 369, 1, 14, null, 'lacinia aenean');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (30, 4, null, 'Chevrolet', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 326, 1, 20, 'nulla integer pede justo', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (31, 4, 'dolor', 'Subaru', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 56, 0, 9, 'eros viverra eget congue eget semper rutrum nulla nunc', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (32, 2, 'sociis natoque penatibus et magnis', 'Nissan', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 160, 0, 8, 'cras in purus eu', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (33, 5, null, 'Chevrolet', 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 75, 0, 19, 'neque duis bibendum', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (34, 4, 'nulla sed accumsan felis', 'Mazda', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 97, 0, 15, 'eget eleifend', 'id luctus nec');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (35, 5, null, 'Infiniti', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 331, 0, 3, 'proin leo', 'massa id lobortis convallis');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (36, 5, 'et magnis dis parturient', 'Chevrolet', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 48, 0, 2, 'dis parturient montes nascetur ridiculus', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (37, 1, 'et', 'Isuzu', 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 174, 1, 17, 'velit', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (38, 5, 'sed', 'Cadillac', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 95, 1, 20, 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (39, 2, 'sed sagittis nam', 'Kia', null, 322, 0, 5, 'sit amet cursus id turpis integer aliquet massa id lobortis', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (40, 2, 'enim in tempor turpis', 'Dodge', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 143, 1, 2, 'hac habitasse platea dictumst', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (41, 1, null, 'Honda', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 357, 1, 12, 'orci luctus et ultrices posuere cubilia', 'tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (42, 5, null, 'Toyota', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 209, 1, 8, 'nec sem duis aliquam convallis nunc proin at', 'pretium quis lectus suspendisse potenti in');
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (43, 4, null, 'Pontiac', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 357, 0, 8, 'ullamcorper purus sit amet nulla quisque', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (44, 4, 'donec ut mauris eget massa', 'Chrysler', 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 295, 1, 15, 'nulla ultrices aliquet maecenas leo odio', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (45, 3, 'mi integer ac', 'Ford', null, 371, 0, 2, null, null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (46, 4, null, 'Nissan', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 183, 0, 2, 'nec condimentum neque sapien placerat ante nulla', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (47, 1, 'quam', 'Ford', null, 129, 1, 4, 'et ultrices', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (48, 4, null, 'Buick', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 262, 0, 4, 'commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (49, 1, 'dui', 'Lotus', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 267, 1, 16, 'eu tincidunt in leo maecenas pulvinar lobortis', null);
insert into Gear (Id, UserProfileId, Headline, Manufacturer, Description, Price, IsActive, GearTypeId, FirstOptionNotes, SecondOptionNotes) values (50, 2, null, 'Mazda', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 36, 1, 2, 'mauris lacinia sapien quis libero nullam sit amet', 'id massa id nisl venenatis lacinia aenean sit amet');

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
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (1, 14, 6, 5, 233, '05/02/2020', '03/02/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (2, 19, 17, 47, 170, '12/23/2019', '08/13/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (3, 17, 17, 1, 234, '09/30/2020', '12/29/2019', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (4, 11, 7, 15, 198, '09/18/2020', '08/31/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (5, 13, 16, 41, 214, '10/01/2020', '05/20/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (6, 17, 15, 40, 76, '08/01/2020', '01/31/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (7, 4, 10, 32, 128, '05/16/2020', '01/02/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (8, 13, 1, 42, 82, '10/13/2020', '07/22/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (9, 19, 20, 1, 167, '12/24/2019', '10/26/2019', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (10, 19, 15, 10, 179, '07/26/2020', '06/23/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (11, 7, 3, 20, 77, '08/19/2020', '02/22/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (12, 16, 18, 23, 146, '03/09/2020', '05/14/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (13, 14, 11, 17, 63, '03/02/2020', '12/07/2019', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (14, 10, 8, 37, 101, '11/13/2019', '07/07/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (15, 10, 1, 12, 119, '10/25/2019', '04/01/2020', 0, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (16, 7, 13, 8, 234, '07/10/2020', '07/26/2020', 0, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (17, 12, 4, 50, 248, '12/27/2019', '10/27/2019', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (18, 13, 14, 13, 46, '10/26/2019', '05/15/2020', 1, 1);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (19, 7, 19, 38, 40, '11/23/2019', '05/18/2020', 1, 0);
insert into Reservation (Id, OwnerId, CustomerId, GearId, AgreedPrice, StartDate, EndDate, Confirmed, ItemReturned) values (20, 9, 12, 41, 103, '06/16/2020', '08/21/2020', 1, 1);
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
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (1, 14, 7, 0, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (2, 5, 19, 1, 'In hac habitasse platea dictumst.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (3, 7, 5, 0, 'Morbi non lectus.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (4, 12, 9, 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (5, 8, 18, 1, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (6, 17, 16, 0, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (7, 19, 8, 0, 'Vivamus tortor.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (8, 17, 19, 1, 'Proin eu mi. Nulla ac enim.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (9, 4, 19, 1, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (10, 14, 9, 1, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (11, 1, 7, 0, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (12, 4, 8, 0, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (13, 16, 14, 1, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (14, 7, 20, 1, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (15, 18, 7, 0, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (16, 13, 7, 1, 'Etiam faucibus cursus urna.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (17, 15, 14, 0, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (18, 1, 5, 1, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (19, 2, 11, 0, 'Praesent blandit.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (20, 4, 2, 1, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (21, 5, 19, 1, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (22, 4, 12, 0, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (23, 20, 8, 1, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (24, 11, 14, 1, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.');
insert into Message (Id, SenderId, RecipientId, Unread, Content) values (25, 18, 18, 1, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
set identity_insert [Message] off