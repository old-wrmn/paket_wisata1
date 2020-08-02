CREATE TABLE role(
role_id varchar(2) not null PRIMARY KEY,
name VARCHAR(15) NOT NULL
);

CREATE TABLE users(
id_user varchar(6) not null PRIMARY KEY,
role_id VARCHAR(2) NOT NULL,
username VARCHAR(15) NOT NULL,
password VARCHAR(15) NOT NULL,
email VARCHAR(20),
address VARCHAR(50),
contact int,
FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE booking(
id_booking varchar(5) not null PRIMARY KEY,
id_user VARCHAR(6) NOT NULL,
date date not null,
status VARCHAR(10) NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE package(
id_package varchar(6) not null PRIMARY KEY,
name varchar(15) NOT NULL,
price int NOT NULL,
itinerary varchar(200) not null
);

CREATE TABLE detail_booking(
id_booking varchar(5) not null,
id_package varchar(6) not null,
number_people int NOT NULL,
total_price int NOT NULL,
PRIMARY KEY (id_booking, id_package),
FOREIGN KEY (id_booking) REFERENCES booking(id_booking),
FOREIGN KEY (id_package) REFERENCES package(id_package)
);

CREATE TABLE package_gallery(
id_item varchar(5) NOT NULL,
id_package varchar(6) not null,
gallery_package varchar(20) not null,
PRIMARY KEY (id_item, id_package),
FOREIGN KEY (id_package) REFERENCES package(id_package)
);

CREATE TABLE tourism(
id_tourism varchar(6) NOT NULL PRIMARY KEY,
name varchar(20) not null,
address varchar(50) not null,
open time,
close time,
ticket int,
description varchar(200),
geom geometry
);

CREATE TABLE tourism_gallery(
id_item varchar(5) NOT NULL,
id_tourism varchar(6) not null,
gallery_tourism varchar(20) not null,
PRIMARY KEY (id_item, id_tourism),
FOREIGN KEY (id_tourism) REFERENCES tourism(id_tourism)
);

CREATE TABLE restaurant(
id_restaurant varchar(6) NOT NULL PRIMARY KEY,
name varchar(20) not null,
address varchar(50) not null,
open time,
close time,
description varchar(200),
geom geometry
);

CREATE TABLE restaurant_gallery(
id_item varchar(5) NOT NULL,
id_restaurant varchar(6) not null,
gallery_restaurant varchar(20) not null,
PRIMARY KEY (id_item, id_restaurant),
FOREIGN KEY (id_restaurant) REFERENCES restaurant(id_restaurant)
);

CREATE TABLE worship_place(
id_worship_place varchar(6) NOT NULL PRIMARY KEY,
name varchar(20) not null,
address varchar(50) not null,
description varchar(200),
geom geometry
);

CREATE TABLE worship_place_gallery(
id_item varchar(5) NOT NULL,
id_worship_place varchar(6) not null,
gallery_worship_place varchar(20) not null,
PRIMARY KEY (id_item, id_worship_place),
FOREIGN KEY (id_worship_place) REFERENCES worship_place(id_worship_place)
);

CREATE TABLE souvenir(
id_souvenir varchar(6) NOT NULL PRIMARY KEY,
name varchar(20) not null,
address varchar(50) not null,
open time,
close time,
description varchar(200),
geom geometry
);

CREATE TABLE souvenir_gallery(
id_item varchar(5) NOT NULL,
id_souvenir varchar(6) not null,
gallery_souvenir varchar(20) not null,
PRIMARY KEY (id_item, id_souvenir),
FOREIGN KEY (id_souvenir) REFERENCES souvenir(id_souvenir)
);

CREATE TABLE hotel(
id_hotel varchar(6) NOT NULL PRIMARY KEY,
name varchar(20) not null,
address varchar(50) not null,
contact int,
geom geometry
);

CREATE TABLE hotel_gallery(
id_item varchar(5) NOT NULL,
id_hotel varchar(6) not null,
gallery_hotel varchar(20),
PRIMARY KEY (id_item, id_hotel),
FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)
);

CREATE TABLE object_point(
no_urut varchar(2) NOT NULL,
id_package varchar(6) NOT NULL,
id_restaurant varchar(6) NOT NULL,
id_worship_place varchar(6) NOT NULL,
id_souvenir varchar(6) NOT NULL,
id_hotel varchar(6) NOT NULL,
id_tourism varchar(6) NOT NULL,
lama_perjalanan varchar(15) not null,
estimasi_waktu varchar(15) not null,
PRIMARY KEY (no_urut, id_package),
FOREIGN KEY (id_package) REFERENCES package(id_package),
FOREIGN KEY (id_restaurant) REFERENCES restaurant(id_restaurant),
FOREIGN KEY (id_worship_place) REFERENCES worship_place(id_worship_place),
FOREIGN KEY (id_souvenir) REFERENCES souvenir(id_souvenir),
FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
FOREIGN KEY (id_tourism) REFERENCES tourism(id_tourism)
);

CREATE TABLE district(
id_district varchar(6) NOT NULL PRIMARY KEY,
name varchar(20) not null,
geom geometry
);