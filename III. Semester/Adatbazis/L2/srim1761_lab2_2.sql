--srim1761
--Szabo Robert

DROP TABLE Kedvencek
DROP TABLE Hozzaszolasok
DROP TABLE Kulcsszavai
DROP TABLE Cikkek
DROP TABLE Kulcsszavak
DROP TABLE Kategoriak
DROP TABLE Felhasznalok
DROP TABLE Orszagok


CREATE TABLE Orszagok(
  OrszagID int identity,
  OrszagNev varchar(100) not null
  constraint PK_Orszagok primary key (OrszagID)
)

CREATE TABLE Felhasznalok (
	FelhasznaloID int identity,
	FelhasznaloNev varchar(100) not null, 
	EmailCim varchar(100) not null, 
	RegisztracioDatuma date not null, 
	OrszagID int foreign key references Orszagok(OrszagID)
	constraint PK_Felhasznalok primary key (FelhasznaloID) ,
)

CREATE TABLE Kategoriak (
	KategoriaID int identity, 
	KategoriaNev varchar(100) not null
	constraint PK_Kategoriak primary key (KategoriaID),
)

CREATE TABLE Cikkek (
	CikkID int identity, 
	CikkCim varchar(100) not null, 
	Datum date not null, 
	SzerzoID int foreign key references Felhasznalok(FelhasznaloID), 
	Szoveg varchar(100) not null, 
	KategoriaID int foreign key references Kategoriak(KategoriaID),  
	Ertekeles int not null,
	CONSTRAINT PK_Cikkek primary key (CikkID),
)

CREATE TABLE Kulcsszavak (
	KulcsszoID int identity,
	KulcszoNev varchar(100) not null,
	constraint PK_Kulcsszavak primary key (KulcsszoID)
)

CREATE TABLE Kulcsszavai (
	CikkID int, 
	KulcsszoID int,
	constraint PK_Kulcsszavai primary key (CikkID,KulcsszoID),
	foreign key (CikkID) references Cikkek(CikkID),
	foreign key (KulcsszoID) references Kulcsszavak(KulcsszoID),
)

CREATE TABLE Hozzaszolasok (
	HozzaszolasID int identity, 
	FelhasznaloID int foreign key references Felhasznalok(FelhasznaloID),
	CikkID int foreign key references Cikkek(CikkID), 
	HozzaszolasDatuma date not null, 
	HozzaszolasSzovege varchar(1000),
	constraint PK_Hozzaszolasok primary key (HozzaszolasID),
)

CREATE TABLE Kedvencek (
	FelhasznaloID int, 
	CikkID int,
	--igy kell mindet
	constraint PK_Kedvencek primary key (CikkID,FelhasznaloID),
	foreign key (FelhasznaloID) references Felhasznalok(felhasznaloID),
	foreign key (CikkID) references Cikkek(CikkID),
)

ALTER TABLE Felhasznalok ADD Neme varchar(1) constraint FerfiVagyNo CHECK (Neme IN ('F', 'N'));
ALTER TABLE Felhasznalok DROP COLUMN EmailCim;
ALTER TABLE Felhasznalok ADD EmailCim varchar(100) not null CONSTRAINT email DEFAULT 'anonymus@emai.com'; 
ALTER TABLE Felhasznalok DROP COLUMN FelhasznaloNev;
ALTER TABLE Felhasznalok ADD FelhasznaloNev varchar(100) not null CONSTRAINT Egyedi unique;
--ALTER TABLE Kulcsszavak DROP CONSTRAINT PK_Kulcsszavak
--ALTER TABLE Kulcsszavak DROP COLUMN KulcsszoID;
--ALTER TABLE Kulcsszavak ADD KulcsszoID int identity(2,5);
--ALTER TABLE Kulcsszavak ADD CONSTRAINT PK_Kulcsszavak primary key (KulcsszoID);
ALTER TABLE Cikkek DROP COLUMN Ertekeles;

INSERT INTO Orszagok (OrszagNev)
VALUES 
	('Romania'),
	('Canada'),
	('USA'),
	('Ungarya'),
	('Italy');

INSERT INTO Felhasznalok(FelhasznaloNev, EmailCim, RegisztracioDatuma)
VALUES 
	('Jhonny', 'jhonnyboy@gmail.com','2018-10-11'),
	('Jhonny2', 'jhonnyboy2@gmail.com','2018-10-12'),
	('Jhonny3', 'jhonnyboy3@gmail.com','2018-10-13'),
	('Jhonny4', 'jhonnyboy4@gmail.com','2018-10-14'),
	('Jhonny5', 'jhonnyboy5@gmail.com','2018-09-24');

INSERT INTO Kategoriak(KategoriaNev)
VALUES 
	('Braking New'),
	('Game News'),
	('Weather News'),
	('National News'),
	('International News')

INSERT INTO Cikkek(CikkCim,Datum,Szoveg)
VALUES 
	('Game article','2018-09-01','News description#1'),
	('Breaking News article','2018-09-09','News description#2'),
	('Weather article','2018-09-29','News description#3'),
	('National article','2018-10-11','News description#4'),
	('International article','2018-10-21','News description#5');

INSERT INTO Kulcsszavak(KulcszoNev)
VALUES
	('News'),
	('Braking'),
	('Weather'),
	('National'),
	('International');

INSERT INTO Hozzaszolasok(HozzaszolasDatuma,HozzaszolasSzovege)
VALUES 
	('2018-09-13','Comment1'),
	('2018-09-19','Comment2'),
	('2018-10-01','Comment3'),
	('2018-10-11','Comment3'),
	('2018-10-19','Comment3');


SELECT * FROM Cikkek;
SELECT TOP 3 * FROM Felhasznalok;
SELECT CikkCim,Datum FROM Cikkek WHERE CikkCim LIKE '%Game%'
SELECT * FROM Hozzaszolasok WHERE HozzaszolasDatuma > '2018-01-01';
SELECT FelhasznaloNev + '+' + EmailCim FROM Felhasznalok WHERE len(FelhasznaloNev) < 10;