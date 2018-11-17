--srim1761
--Szabo Robert Istvan

-- 1
/*
Adjuk meg azon bentlakás(oka)t, mely(ek) CSAK ‘8 agyas’ szobával rendelkezik/rendelkeznek! (Bentlakasok.Nev, Bentlakasok.Cim)
*/
SELECT Bentlakasok.Nev,Bentlakasok.Cim
FROM Bentlakasok
WHERE Bentlakasok.BentlakasID in
	(SELECT BentlakasID
	FROM SzobaTipusok, Szobak
	WHERE SzobaTipusok.AgyakSzama = 8 AND 
			SzobaTipusok.SzobaTipusID=Szobak.SzobaTipusID AND
			Szobak.BentlakasID IN 
			(SELECT Szobak.BentlakasID
			FROM Szobak
			GROUP BY Szobak.BentlakasID
			HAVING COUNT (DISTINCT Szobak.SzobaTipusID) = 1
			)	
	)

/*
Adjuk meg a legtöbb szobával rendelkező bentlakás(oka)t!! (Bentlakasok.Nev, Bentlakasok.Cim, Bentlakasok.SzobaSzam)
*/


SELECT Bentlakasok.Nev, Bentlakasok.Cim, Bentlakasok.SzobaSzam
FROM Bentlakasok
WHERE Bentlakasok.SzobaSzam = (
	SELECT MAX(Bentlakasok.SzobaSzam)
	FROM Bentlakasok
	)
/*
Adjuk meg azon bentlakás(oka)t, mely(ek)ben van ‘8 agyas’, DE ‘5 agyas’ ÉS ‘2 agyas’ szoba NINCS! (Bentlakasok.Nev)
*/

SELECT Bentlakasok.Nev 
FROM Bentlakasok
WHERE Bentlakasok.BentlakasID IN (
	SELECT BentlakasID
	FROM SzobaTipusok, Szobak
	WHERE SzobaTipusok.AgyakSzama = 8 AND 
		SzobaTipusok.SzobaTipusID = Szobak.SzobaTipusID AND
		Szobak.BentlakasID NOT IN (
			SELECT Szobak.BentlakasID
			FROM SzobaTipusok, Szobak
			WHERE (
				SzobaTipusok.AgyakSzama = 5 OR SzobaTipusok.AgyakSzama = 2
			)
		)
)

--4
/*
Adjuk meg azon bentlakás(oka)t, mely(ek) ‘8 agyas’ és ‘5 agyas’ szobákat tartalmaz(nak)! (Bentlakasok.Nev, Bentlakasok.Cim)
*/

SELECT Bentlakasok.Nev , Bentlakasok.Cim
FROM Bentlakasok
WHERE Bentlakasok.BentlakasID IN (
	SELECT BentlakasID
	FROM SzobaTipusok, Szobak
	WHERE SzobaTipusok.AgyakSzama = 8 AND 
		SzobaTipusok.SzobaTipusID = Szobak.SzobaTipusID AND
		Szobak.BentlakasID IN (
			SELECT Szobak.BentlakasID
			FROM Szobak, SzobaTipusok
			WHERE SzobaTipusok.AgyakSzama = 5 AND
			SzobaTipusok.SzobaTipusID=Szobak.SzobaTipusID
		)
)

--5
/*
Adjuk meg azon bentlakás(ok) nevét és címét, amely(ek)ben a következő diákok laknak:
 (‘Kukorica Jancsi’, ‘Scheldon Cooper’, ‘Mark Zuckerberg’)! Minden bentlakás csak egyszer jelenjen meg az eredményben! 
 (Bentlakasok.Nev, Bentlakasok.Cim)
*/


SELECT DISTINCT Bentlakasok.Nev, Bentlakasok.Cim
FROM Bentlakasok
JOIN Lakik 
ON LAKIK.BentlakasID = Bentlakasok.BentlakasID
JOIN Diakok
ON LAKIK.DiakID = Diakok.DiakID
WHERE Diakok.Nev like '%Kukorica Jancsi%'
   or Diakok.Nev like '%Scheldon Cooper%'
   or Diakok.Nev like '%Mark Zuckerberg%'

--6
/*
Adjuk meg az ‘informatika’ szakon tanuló diák(ok) nevét! (Diákok.Nev)
*/
SELECT DISTINCT Diakok.Nev
FROM Diakok
JOIN Szakok
ON Diakok.SzakID = Szakok.SzakID
WHERE Szakok.SzakNev LIKE '%informatika%'

--7
/*
Adjuk meg azon diáko(ka)t, aki(k) ‘foldrajz’ szakon tanul(nak) és a 'Hoeger-Rodriguez' bentlakásban lakik/laknak! (Diákok.Nev)
*/


SELECT Diakok.Nev
FROM Diakok
JOIN Szakok
ON Diakok.SzakID = Szakok.SzakID
JOIN Lakik
ON Diakok.DiakID = Lakik.DiakID
JOIN Bentlakasok
ON Lakik.BentlakasID = Bentlakasok.BentlakasID
WHERE Szakok.SzakNev LIKE '%foldrajz%' AND Bentlakasok.Nev LIKE '%Hoeger-Rodriguez%'

--8
/*
Adjuk meg azon bentlakás(oka)t, mely(ek)ben legalább 15 szoba van (SzobakSzama)! (Bentlakasok.Nev, Bentlakasok.Cim)
*/

SELECT Bentlakasok.Nev, Bentlakasok.Cim
FROM Bentlakasok
WHERE Bentlakasok.SzobaSzam > 15

--9
/*
Módosítsuk azon diák(ok) telefonszámát ’000000000’-ra, aki(k) a 'Kreiger, Thiel and Schmeler' bentlakásban lakik/laknak!
*/

UPDATE Diakok
SET Telefonszam = '000000000'
FROM Diakok
JOIN Lakik
ON Lakik.DiakID = Diakok.DiakID
JOIN Bentlakasok
ON Bentlakasok.BentlakasID = Lakik.BentlakasID
WHERE Bentlakasok.Nev LIKE '%Kreiger, Thiel and Schmeler%'

--10
/*
Töröljük a 'Layla Latimer' nevű diákot!
*/

DELETE FROM Lakik
WHERE DiakID=(
	SELECT DiakID
	FROM Diakok
	WHERE Nev LIKE '%Layla Latimer%'
)
DELETE FROM Diakok
WHERE Nev LIKE '%Layla Latimer%'

--11
/*
A 100-nál nagyobb szobaszámmal rendelkező bentlakás(ok)hoz szúrjunk be 5 darab 1 ágyas szobát!
*/

INSERT INTO SzobaTipusok Values( (
	SELECT MAX(SzobaTipusID)+1 
	FROM SzobaTipusok),'1 agyas', 1, 100
)


INSERT INTO Szobak(BentlakasID,SzobaTipusID,SzobakSzama)
SELECT BentlakasID, (
	SELECT SzobaTipusID
	FROM SzobaTipusok
	WHERE AgyakSzama=1
	),5
FROM Bentlakasok
WHERE SzobaSzam>100


--12
/*
A biológia szakos diákokat költöztessük a ‘Maggio’ bentlakásba, és a történelem szakosokat a ‘Kshlerin and Sons’ bentlakásba!
*/

UPDATE Bentlakasok
SET SzobaSzam=SzobaSzam+5
WHERE SzobaSzam>100


UPDATE Lakik
SET BentlakasID = (
	SELECT BentlakasID 
	FROM Bentlakasok 
	WHERE Nev LIKE '%Maggio%')
WHERE DiakID IN (
	SELECT	DiakID 
	FROM Diakok 
	WHERE SzakID = (
		SELECT SzakID 
		FROM Szakok 
		WHERE SzakNev LIKE '%biologia%'
		)
	)

UPDATE Lakik
SET BentlakasID = (
	SELECT BentlakasID 
	FROM Bentlakasok 
	WHERE Nev LIKE '%Kshlerin and Sons%'
	)
where DiakID IN (
	SELECT DiakID 
	FROM Diakok 
	WHERE SzakID = (
		SELECT SzakID 
		FROM Szakok 
		WHERE SzakNev LIKE '%tortenelem%'
	)
)