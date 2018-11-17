DROP TABLE Kedvencek
DROP TABLE Hozzaszolasok
DROP TABLE Kulcsszavai
DROP TABLE Cikkek
DROP TABLE Kulcsszavak
DROP TABLE Kategoriak
DROP TABLE Felhasznalok
DROP TABLE Orszagok


CREATE TABLE Orszagok(
  OrszagID int primary key identity,
  OrszagNev varchar(100) not null
)

CREATE TABLE Felhasznalok (
	FelhasznaloID int primary key identity,
	FelhasznaloNev varchar(100) not null, 
	EmailCim varchar(100) not null, 
	RegisztracioDatuma date not null, 
	OrszagID int foreign key references Orszagok(OrszagID)
)

CREATE TABLE Kategoriak (
	KategoriaID int primary key identity, 
	KategoriaNev varchar(100) not null
)

CREATE TABLE Cikkek (
	CikkID int primary key identity, 
	CikkCim varchar(100) not null, 
	Datum date not null, 
	SzerzoID int foreign key references Felhasznalok(FelhasznaloID), 
	Szoveg varchar(100) not null, 
	KategoriaID int foreign key references Kategoriak(KategoriaID),  
	Ertekeles int not null,
)

CREATE TABLE Kulcsszavak (
	KulcsszoID int primary key identity, 
	KulcszoNev varchar(100) not null,
)

CREATE TABLE Kulcsszavai (
	CikkID int, 
	KulcsszoID int,
	primary key (CikkID,KulcsszoID),
	foreign key (CikkID) references Cikkek(CikkID),
	foreign key (KulcsszoID) references Kulcsszavak(KulcsszoID),
)

CREATE TABLE Hozzaszolasok (
	HozzaszolasID int primary key identity, 
	FelhasznaloID int foreign key references Felhasznalok(FelhasznaloID),
	CikkID int foreign key references Cikkek(CikkID), 
	HozzaszolasDatuma date not null, 
	HozzaszolasSzovege varchar(100),
)

CREATE TABLE Kedvencek (
	FelhasznaloID int, 
	CikkID int,
	primary key (CikkID,FelhasznaloID),
	foreign key (FelhasznaloID) references Felhasznalok(felhasznaloID),
	foreign key (CikkID) references Cikkek(CikkID),
)


INSERT INTO Orszagok (OrszagNev)
VALUES 
	('Romania'),
	('Canada'),
	('USA'),
	('Italy');

INSERT INTO Felhasznalok(FelhasznaloNev, EmailCim, RegisztracioDatuma)
VALUES 
	('Jhonny', 'jhonnyboy@gmail.com','2018-10-11'),
	('Jhonny2', 'jhonnyboy2@gmail.com','2018-10-12'),
	('Jhonny3', 'jhonnyboy3@gmail.com','2018-10-13'),
	('Jhonny4', 'jhonnyboy4@gmail.com','2018-10-14');

INSERT INTO Kategoriak(KategoriaNev)
VALUES 
	('Braking New'),
	('Game News');

INSERT INTO Cikkek(CikkCim,Datum,Szoveg,Ertekeles)
VALUES 
	('News1','2018-10-11','News description', 2),
	('News2','2018-10-11','News description', 3);

INSERT INTO Kulcsszavak(KulcszoNev)
VALUES
	('News'),
	('Braking');

INSERT INTO Hozzaszolasok(HozzaszolasDatuma,HozzaszolasSzovege)
VALUES 
	('2018-10-13','Comment1'),
	('2018-10-19','Comment2'),
	('2018-10-01','Comment3');
