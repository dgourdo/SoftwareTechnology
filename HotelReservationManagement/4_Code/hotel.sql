drop database if exists hotel;
create database hotel;
use hotel;

create table Client
(c_id int(6) not null auto_increment ,email varchar(20) not null,password varchar(12) not null,firstname varchar(15) not null,
 lastname varchar(15) not null,tel varchar(10) not null,
 primary key(c_id),
-- c_id->Αρχική τιμή 1,αυξάνεται όσο κάνουμε insert δεδομένα

-- Για τους παρακάτω περιορισμούς χρησιμοποιήθηκαν κανονικές εκφράσεις από το μάθημα των Μεταγλωττιστών:
 CONSTRAINT chk_email CHECK (email LIKE '%@%.%' AND email NOT LIKE '%@%.%@%'),
 CONSTRAINT chk_password CHECK (password REGEXP '^[a-zA-Z0-9!@#$%^&*()_+\\-=\\[\\]{};\':",.<>/?]{8,12}$'),
 CONSTRAINT chk_firstname CHECK (firstname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'), -- ονόματα στα ελληνικά
 CONSTRAINT chk_lastname CHECK (lastname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_tel CHECK (tel REGEXP '^[0-9]+$')
);


create table Staff
(s_id int(6) not null auto_increment,s_email varchar(20) not null,s_firstname varchar(15) not null,
 s_lastname varchar(15) not null,s_tel varchar(10) not null,salary int(5) not null,job_descr varchar(20),date_of_joining date,
 primary key(s_id),

 CONSTRAINT chk_s_email CHECK (s_email LIKE '%@%.%' AND s_email NOT LIKE '%@%.%@%'),
 CONSTRAINT chk_s_firstname CHECK (s_firstname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_s_lastname CHECK (s_lastname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_s_tel CHECK (s_tel REGEXP '^[0-9]+$'),

-- Το πεδίο job_descr παίρνει μόνο τις τρεις επιτρεπόμενες τιμές: "Reception", "Administrator" και "Programmer",
-- καθώς η ΒΔ δεν ασχολείται με άλλες εργασίες του ξενοδοχείου,παρά μόνο με τις κρατήσεις.
 CONSTRAINT chk_job_descr CHECK (job_descr IN ('Reception', 'Administrator', 'Programmer'))
);

create table Rooms
(r_id int(3) not null,capacity int(1) not null,availability varchar(3) not null,r_cost int(3) not null,
 primary key(r_id),

 CONSTRAINT chk_capacity CHECK (capacity IN ('2', '3', '4')),
 CONSTRAINT chk_availability CHECK (availability IN ('yes', 'no'))
);

create table Booking
(b_id int(5) not null auto_increment,c_id int(6) not null,r_id int(3) not null, arrival date,departure date,
 primary key(b_id),
 foreign key (c_id) references Client(c_id),
 foreign key (r_id) references Rooms(r_id),

 CONSTRAINT chk_arrival_before_departure CHECK (arrival < departure)
);

create table Message
(m_id int(5) not null auto_increment,timestamp timestamp default current_timestamp,m_email varchar(20) not null,
 m_firstname varchar(15) not null,m_lastname varchar(15) not null,m_tel varchar(10) not null,message text not null,
 primary key(m_id),
 CONSTRAINT chk_m_email CHECK (m_email LIKE '%@%.%' AND m_email NOT LIKE '%@%.%@%'),
 CONSTRAINT chk_m_firstname CHECK (m_firstname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_m_lastname CHECK (m_lastname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_m_tel CHECK (m_tel REGEXP '^[0-9]+$'));

create table Card
(card_id int(5) not null auto_increment,number int(16) not null,name varchar(30) not null,month_year int(7) not null,CVV int(3) not null,
 primary key(card_id));

create table TemporaryPayment
(tp_id int(5) not null auto_increment,firstname varchar(15) not null,lastname varchar(15) not null,deposit varchar(3) DEFAULT 'no',
 primary key(tp_id),

 CONSTRAINT chk_tp_firstname CHECK (firstname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_tp_lastname CHECK (lastname REGEXP '^[Α-ΩΆΈΉΊΌΎΏα-ωάέήίόύώ]*$'),
 CONSTRAINT chk_deposit CHECK (deposit IN ('yes', 'no'))
);


create table Payment
(p_id int(5) not null auto_increment,b_id int(5) not null,cost decimal(6,2) not null,card_id int(5),tp_id int(5),
 primary key(p_id),
 foreign key (b_id) references Booking(b_id),
 foreign key (card_id) references Card(card_id),
 foreign key (tp_id) references TemporaryPayment(tp_id)
);

-- Προσθέτουμε τον εξής περιορισμό:Μόνο ένα εκ των πεδίων card_id,tp_id μπορεί να έχει τιμή.
-- Το άλλο πεδίο θα είναι υποχρεωτικά κενό.
alter table Payment
    ADD CONSTRAINT chk_Payment
        CHECK ((card_id IS NULL AND tp_id IS NOT NULL) OR (card_id IS NOT NULL AND tp_id IS NULL));

insert into Staff(s_email, s_firstname, s_lastname, s_tel, salary, job_descr, date_of_joining) values
                                                                                                   ('nxr12@gmail.com','Νίκος','Χρυσόπουλος',6912345678,1500,'Reception','2022-12-9'),
                                                                                                   ('alexdim@otenet.gr','Αλέξανδρος','Δημητρίου',6912345687,1700,'Reception','2020-1-5'),
                                                                                                   ('maria1975@gmail.com','Μαρία','Παπαδοπούλου',6974563541,1800,'Reception','2018-5-30'),
                                                                                                   ('dgour@gmail.com','Δημήτριος','Γουρδομιχάλης',6974779812,2000,'Programmer','2023-8-20'),
                                                                                                   ('elenparask@gmail.com','Ελένη','Παρασκευοπούλου',6999999999,3000,'Administrator','2018-5-1');

insert into Rooms values (001,2,'yes',90),(002,2,'yes',90),(003,2,'yes',90),(101,2,'yes',90),(102,2,'yes',90),(103,2,'yes',90),(201,2,'yes',90),(202,2,'yes',90),
                         (004,3,'yes',110),(005,3,'yes',110),(006,3,'yes',110),(104,3,'yes',110),(105,3,'yes',110),(106,3,'yes',110),(203,3,'yes',110),(204,3,'yes',110),
                         (007,4,'yes',150),(107,4,'yes',150),(205,4,'yes',150),(206,4,'yes',150);

select * from Staff;
select * from Rooms;
select * from TemporaryPayment;

CREATE USER 'gourdo4'@'localhost' IDENTIFIED BY 'kotronas4';
GRANT ALL PRIVILEGES ON hotel.* TO 'gourdo4'@'localhost';