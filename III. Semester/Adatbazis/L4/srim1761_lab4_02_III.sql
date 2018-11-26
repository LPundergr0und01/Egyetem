--9
/*
Módosítsuk azon diák(ok) telefonszámát ’000000000’-ra, aki(k) a 'Kreiger, Thiel and Schmeler' bentlakásban lakik/laknak!
*/

DECLARE @NUM VARCHAR(12) = '000000000'

UPDATE Diakok
SET Telefonszam = @NUM
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


DECLARE @DID INT;

SELECT @DID=DiakID
FROM Diakok
WHERE Nev like 'Layla Latimer'

DELETE FROM Lakik
WHERE DiakID=@DID

DELETE FROM Diakok
WHERE DiakID=@DID


--11
/*
A 100-nál nagyobb szobaszámmal rendelkező bentlakás(ok)hoz szúrjunk be 5 darab 1 ágyas szobát!
*/

INSERT INTO SzobaTipusok VALUES( (SELECT MAX(SzobaTipusID)+1 FROM SzobaTipusok),'1 agyas', 1, 300)

DECLARE @SZTID INT;

SELECT @SZTID=SzobaTipusID 
FROM SzobaTipusok
WHERE AgyakSzama=1

INSERT INTO Szobak(BentlakasID,SzobaTipusID,SzobakSzama)
SELECT BentlakasID, @SZTID,5
FROM Bentlakasok
WHERE SzobaSzam>100


--12
/*
A biológia szakos diákokat költöztessük a ‘Maggio’ bentlakásba, és a történelem szakosokat a ‘Kshlerin and Sons’ bentlakásba!
*/

DECLARE @BID1 INT;
DECLARE @BID2 INT;
DECLARE @SZID1 INT;
DECLARE @SZID2 INT;

SELECT @BID1=BentlakasID
FROM Bentlakasok
WHERE Nev like 'Maggio'

SELECT @SZID1=SzakID
FROM Szakok
WHERE SzakNev like 'biologia'

update Lakik
SET BentlakasID =@BID1
WHERE DiakID in
(
SELECT DiakID
FROM Diakok
WHERE SzakID =@SZID1
)


SELECT @BID2=BentlakasID
FROM Bentlakasok
WHERE Nev like 'Kshlerin and Sons'

SELECT @SZID2=SzakID
FROM Szakok
WHERE SzakNev like 'tortenelem'

update Lakik
SET BentlakasID =@BID2
WHERE DiakID in
(
SELECT DiakID
FROM Diakok
WHERE SzakID =@SZID2
)