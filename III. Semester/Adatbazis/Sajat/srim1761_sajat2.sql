--srim1761
--Szabo Robert

DROP TABLE Hasznal
DROP TABLE Elhelyezkedes
DROP TABLE Oktat
DROP TABLE Tanit
DROP TABLE Osztalytermek
DROP TABLE Tanarok
DROP TABLE Iskolak
DROP TABLE Epuletek
DROP TABLE Tantargyak
DROP TABLE Diakok
DROP TABLE Osztalyok
DROP TABLE Bentlakasok
DROP TABLE Varosok
DROP TABLE Allamok

CREATE TABLE Allamok(
	AllamID int identity,
	AllamNev varchar(100) not null,
	constraint PK_Allamok primary key (AllamID),
)

CREATE TABLE Varosok(
	VarosID int identity,
	VarosNev varchar(100) not null,
	constraint PK_Varosok primary key (VarosID)
)

CREATE TABLE Bentlakasok(
	BentlakasID int identity,
	BentlakasNev varchar(100) not null,
	Ferohely int not null,
	VarosID int foreign key references Varosok(VarosID),
	constraint PK_Bentlakasok primary key (BentlakasID)
)

CREATE TABLE Osztalyok(
	OsztalyID int identity,
	Evfolyam varchar(100) not null,
	Szak varchar(100) not null,
	constraint PK_Osztalyok primary key (OsztalyID)
)

CREATE TABLE Diakok(
	Azonosito int identity,
	OsztalyID int foreign key references Osztalyok(OsztalyID),
	DiakNev varchar(100) not null,
	DiakEmailCim varchar(100) not null,
	DiakTelefonSzam int not null,
	constraint PK_Diakok primary key (Azonosito)
)

CREATE TABLE Tantargyak(
	TantargyID int identity,
	TantargyNev varchar(100) not null,
	constraint PK_Tantargyak primary key (TantargyID)
)

CREATE TABLE Epuletek(
	EpuletID int identity,
	EpuletNev varchar(100) not null,
	constraint PK_Epuletek primary key (EpuletID)
)

CREATE TABLE Iskolak(
	IskolaID int identity,
	AllamID int foreign key references Allamok(AllamID),
	EpuletID int foreign key references Epuletek(EpuletID),
	IskolaNev varchar(100) not null,
	constraint PK_Iskolak primary key (IskolaID)
)

CREATE TABLE Tanarok(
	TanarID int identity,
	IskolaID int foreign key references Iskolak(IskolaID),
	TanarNev varchar(100) not null,
	Fizetes int not null,
	constraint PK_Tanarok primary key (TanarID)
)

CREATE TABLE Osztalytermek(
	TeremID int identity,
	EpuletID int foreign key references Epuletek(EpuletID),
	Ferohely int not null,
	TeremNev varchar(100) not null,
)

CREATE TABLE Tanit(
	TanarID int foreign key references Tanarok(TanarID),
	TantargyID int foreign key references Tantargyak(TantargyID),
	constraint PK_Tanit primary key (TanarID,TantargyID),
)

CREATE TABLE Oktat(
	TanarID int foreign key references Tanarok(TanarID),
	OsztalyID int foreign key references Osztalyok(OsztalyID),
	constraint PK_Oktat primary key (TanarID,OsztalyID),
)

CREATE TABLE Elhelyezkedes(
	IskolaID int foreign key references Iskolak(IskolaID),
	VarosID int foreign key references varosok(VarosID),
	constraint PK_Elhelyezkedes primary key (IskolaID,VarosID),
)

CREATE TABLE Hasznal(
	IskolaID int foreign key references Iskolak(IskolaID),
	BentlakasID int foreign key references Bentlakasok(BentlakasID),
	constraint PK_Hasznal primary key (IskolaID,BentlakasID),
)
