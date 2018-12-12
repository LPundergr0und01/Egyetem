SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
1. Írjunk tárolt eljárást, mely segítségével megadhatjuk azon kategóriá(ka)t (Kategoriak.KategoriaNev),
mely(ek)hez a legkésőbb regisztrált felhasználók a legkevesebb cikket írták! 
Ügyeljünk arra, hogy lehet olyan felhasználó, aki egyetlen cikket sem írt eddig!
*/

CREATE PROCEDURE Egy
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @REG DATE
	SET @REG = (
		SELECT MIN(Felhasznalok.RegisztracioDatuma)
		FROM Felhasznalok
	)

	SELECT Felhasznalok.FelhasznaloID INTO #TMP1
	FROM Felhasznalok
	WHERE Felhasznalok.RegisztracioDatuma = @REG

	SELECT Kategoriak.KategoriaID, COUNT(Cikkek.CikkID) AS Cszam INTO #TMP2
	FROM Cikkek 
	INNER JOIN #TMP1
	ON #TMP1.FelhasznaloID = Cikkek.SzerzoID
	RIGHT JOIN Kategoriak ON Kategoriak.KategoriaID = Cikkek.KategoriaID
	GROUP BY Kategoriak.KategoriaID

	SELECT Kategoriak.KategoriaNev
	FROM Kategoriak
	JOIN #TMP2
	ON #TMP2.KategoriaID = Kategoriak.KategoriaID
	WHERE #TMP2.Cszam = (
		SELECT MIN(Cszam)
		FROM #TMP2
	)

	DROP TABLE #TMP1
	DROP TABLE #TMP2
END
GO

/*2. Írjunk tárolt eljárást, melynek bemenő paramétere egy természetes szám (@pSzam)!
Ha @pSzam<0, írjunk ki megfelelő hibaüzenetet!
Ellenkező esetben, írassuk ki azon felhasználó(ka)t, aki(k) által írt cikkek hozzászólásainak száma nagyobb, 
mint a paraméterként megadott szám!*/

CREATE PROCEDURE Ketto
	@pSzam int
AS
BEGIN
	IF @pSzam <= 0 Print('Szam > 0')
	ELSE BEGIN
		SELECT DISTINCT Felhasznalok.FelhasznaloNev
		FROM Felhasznalok
		JOIN Cikkek
		ON Felhasznalok.FelhasznaloID = Cikkek.SzerzoID
		JOIN Hozzaszolasok
		ON Hozzaszolasok.CikkID = Cikkek.CikkID
		GROUP BY Felhasznalok.FelhasznaloNev , Hozzaszolasok.CikkID 
		HAVING COUNT(Hozzaszolasok.CikkID) > @pSzam
	END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*3. Tárolt eljárás segítségével növeljük a legalább @pBerlesSzam (bemenő paraméter, int)
 esetben kibérelt autók napidíját 10%-kal! Kimeneti paraméter: @pmasz (int) - 
 módosított autók száma. Megj. Ha van olyan autó, melynek napiára 200RON feletti, ezek esetén ne végezze el 
 a módosítást (feleslegesen)!
*/


CREATE PROCEDURE harom 
	@pKedvelesSzam INT,
	@pmfsz INT OUTPUT
AS  
	BEGIN
				SELECT Felhasznalok.FelhasznaloNev INTO #tmp1
				FROM Felhasznalok
				JOIN Cikkek
				ON Cikkek.SzerzoID=Felhasznalok.FelhasznaloID
				GROUP BY Felhasznalok.FelhasznaloNev
				HAVING SUM(Cikkek.Ertekeles)>@pKedvelesSzam


				UPDATE Felhasznalok
				SET Fizetes =
					CASE
						WHEN  Fizetes<750
						THEN  Fizetes+Fizetes*15/100
						ELSE  Fizetes
					END, @pmfsz=@pmfsz+1
				FROM Felhasznalok
				JOIN #tmp1
				ON #tmp1.FelhasznaloNev=Felhasznalok.FelhasznaloNev
				WHERE #tmp1.FelhasznaloNev=Felhasznalok.FelhasznaloNev
				
				DROP TABLE #tmp1
	END
GO





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*4. Írjunk függvényt, melynek bemenő paraméterei: @pRegEv-, @pErtekeles-int, @pD1-, @p2-dátum, @pKategoriaNev-string típusúak! A függvény térítse vissza (int típusú változóban), hogy az adott évben (@pRegEv) regisztrált felhasználók adott kategóriába (@pKategoriaNev) eső, @pD1 és @pD2 között megjelent cikkei hány százalékának értékelése nagyobb, mint @pErtekeles! 
Megj. Ellenőrizzük a bemeneti adatok helyességét (pl. @pDatum1 nem lehet későbbi, mint @pDatum2, egyik sem lehet az aktuális dátumnál későbbi stb.)
 Hibás bemenet esetén a visszatérítési érték: -1.*/

GO
 CREATE FUNCTION negy(
	@pRegEv INT,
	@pErtekeles INT,
	@pD1 DATE, 
	@pD2 DATE,
	@pKategoriaNev VARCHAR(30)
)
RETURNS INT
	BEGIN

			if (@pD2<@pD1 or @pD2>GETDATE() or @pErtekeles<0)
				BEGIN
				RETURN -1
		END
		DECLARE @osszes INT, @kedvezo INT

		SELECT @osszes= COUNT(DISTINCT CikkID)
		FROM Kategoriak	
		JOIN Cikkek ON Kategoriak.KategoriaID=Cikkek.KategoriaID
		JOIN Felhasznalok ON FelhasznaloID=SzerzoID
		WHERE YEAR(RegisztracioDatuma)=@pRegEv AND KategoriaNev LIKE @pKategoriaNev AND Cikkek.Datum BETWEEN @pD1 AND @pD2

		IF @osszes<1
			RETURN -1;	
	
		SELECT @kedvezo= COUNT(DISTINCT CikkID)
		FROM Kategoriak
		JOIN Cikkek ON Kategoriak.KategoriaID=Cikkek.KategoriaID
		JOIN Felhasznalok ON FelhasznaloID=SzerzoID
		WHERE YEAR(RegisztracioDatuma)=@pRegEv AND KategoriaNev LIKE @pKategoriaNev AND Cikkek.Datum BETWEEN @pD1 AND @pD2 AND Ertekeles>@pErtekeles

		RETURN (@kedvezo/@osszes)*100
		
	END
GO

/*5. Írjunk függvényt, mely kiszámolja, hogy egy adott felhasználó hány nappal ezelőtt 
kezdett hozzá az íráshoz (az első cikkének publikálásától számítjuk)!
Bemeneti paraméter: @pFelhNev-string típusú, visszatérítési érték: eltelt napok száma-int típusú. */

GO
CREATE FUNCTION ot
(@pFelhNev VARCHAR(30))
RETURNS INT
	BEGIN

		DECLARE @NSZAM INT

		SELECT @NSZAM=DATEDIFF(DAY,MIN(Cikkek.Datum),GETDATE())
		FROM Felhasznalok
		JOIN Cikkek ON FelhasznaloID=SzerzoID
		WHERE FelhasznaloNev=@pFelhNev

		RETURN @NSZAM

	END
GO

/*6. Írjunk tárolt eljárást, mellyel egy új cikkre vonatkozó információkat vezethetünk fel
 az adatbázisba! A tárolt eljárás paraméterei:
 @pCikkCim, @pDatum, @pSzoveg, @pSzerzoNev, @pKategoriaNev, @pKulcsszoNev!
 Ha az adott cikk már létezik az adatbázisban (CikkCim és SzerzoNev is egyezik), 
 írjunk ki megfelelő üzenetet! A többi táblába való beszúrás előtt ellenőrizzük, 
 hogy megtalálható-e minden más adat az adatbázisban (pl. létezik-e az adott kategória,
 szerző, kulcsszó? stb.)! Ha nem, akkor szúrjuk be az összes megfelelő táblába az új 
 adatokat (a paraméterként meg nem adott értékeket NULL-ra állíthatjuk,
  ha NINCS az adott mezőhöz Default megszorítás rendelve)!*/


GO
CREATE PROCEDURE hat(
	@pCikkCim VARCHAR(30), 
	@pDatum VARCHAR(30), 
	@pSzoveg VARCHAR(30), 
	@pSzerzoNev VARCHAR (30), 
	@pKategoriaNev VARCHAR(30), 
	@pKulcsszoNev VARCHAR(30)
)
AS 
BEGIN
	SET NOCOUNT ON

	IF EXISTS (
		SELECT * 
		FROM Cikkek, Felhasznalok 
		WHERE SzerzoID=FelhasznaloID AND (FelhasznaloNev LIKE @pSzerzoNev AND  CikkCim LIKE @pCikkCim)
		)
	BEGIN 
		RAISERROR('Mar letezo adatok!' ,9,1)
		END
	ELSE
	BEGIN 

		DECLARE @szID INT, @kID INT,@kulcs INT

		SELECT @szID=Felhasznalok.FelhasznaloID
		FROM Felhasznalok
		WHERE FelhasznaloNev LIKE @pSzerzoNev

		IF EXISTS(
			SELECT * 
			FROM Kategoriak 
			WHERE KategoriaNev LIKE @pKategoriaNev
		)
		BEGIN
			SELECT @kID=KategoriaID 
			FROM Kategoriak 
			WHERE KategoriaNev LIKE @pKategoriaNev
		END
		ELSE
			BEGIN
			INSERT INTO Kategoriak VALUES (@pKategoriaNev)
			SELECT @kID=KategoriaID 
			FROM Kategoriak 
			WHERE KategoriaNev LIKE @pKategoriaNev
		END

		INSERT INTO Cikkek VALUES (@pCikkCim,@pDatum,@pSzoveg,@szID,@kID,1);


		IF EXISTS (
			SELECT * 
			FROM Kulcsszavak 
			WHERE KulcsszoNev LIKE @pKulcsszoNev
			)
		BEGIN
			SELECT @kulcs=KulcsszoID 
			FROM Kulcsszavak 
			WHERE Kulcsszavak.KulcsszoNev LIKE @pKulcsszoNev
		END
		ELSE
		BEGIN
			INSERT INTO Kulcsszavak VALUES (@pKulcsszoNev)
			SELECT @kulcs=KulcsszoID 
			FROM Kulcsszavak 
			WHERE Kulcsszavak.KulcsszoNev LIKE @pKulcsszoNev
		END

		DECLARE @cikk INT
		SELECT @cikk=Cikkek.CikkID 
		FROM Cikkek 
		WHERE CikkCim LIKE @pCikkCim

		INSERT INTO Kulcsszavai VALUES (@cikk,@kulcs);

		END 
	END
GO

DECLARE @kat VARCHAR(30)
EXEC Egy @kat OUT
SELECT @kat AS KevesCikk_Kategoria

EXEC Ketto 11
EXEC Ketto -1

DECLARE @outp INT
EXEC harom 1,@outp OUT
SELECT @outp AS kedvenc_Felh
EXEC harom-1,@outp OUT
SELECT @outp AS kedvenc_Felh

DECLARE @szazl INT
EXEC @szazl=negy '2017',3, '2013.01.01', '2018.11.11','Politika'--'Eletmod'
SELECT @szazl

DECLARE @napSz INT
EXEC @napSz=ot 'Anna' 
PRINT @napSz
EXEC @napSz=ot 'Aliz' 
PRINT @napSz

EXEC hat 'Cikk Cim', '01/11/2018', 'szoveg','Anna','Eletmod', 'futas'
EXEC hat 'Karacsonyi ajandekotletek', '01/11/2018', 'fa....','Anna','Eletmod', 'karacsony'
SELECT * FROM Cikkek
SELECT * FROM Kulcsszavai,Kulcsszavak WHERE Kulcsszavai.KulcsszoID=Kulcsszavak.KulcsszoID


