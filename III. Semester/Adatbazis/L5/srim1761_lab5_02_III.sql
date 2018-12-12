/*9.Módosítsuk azon diák(ok) telefonszámát ’000000000’-ra, aki(k) a 'Kreiger, Thiel and Schmeler' bentlakásban lakik/laknak!*/

--tarolt eljarassal

GO
CREATE PROCEDURE kilenc	(
	@bentl VARCHAR(30),
	@szam VARCHAR(12)
	)
AS BEGIN
	SET NOCOUNT ON
	UPDATE Diakok
	SET Telefonszam=@szam
	WHERE DiakID IN	(
		SELECT DiakID
		FROM Lakik,Bentlakasok
		WHERE Lakik.BentlakasID=Bentlakasok.BentlakasID AND Bentlakasok.Nev LIKE @bentl
	)
END
GO

--10
/*
Töröljük a 'Layla Latimer' nevű diákot!
*/

--tarolt eljarassal
GO
CREATE PROCEDURE tiz(
	@nev VARCHAR(30)
)
AS BEGIN
	DECLARE @ln INT;

	SELECT @ln=DiakID
	FROM Diakok
	WHERE Nev LIKE @nev

	DELETE FROM Lakik
	WHERE DiakID=@ln

	DELETE FROM Diakok
	WHERE DiakID=@ln
END
GO


--11.A 100-nál nagyobb szobaszámmal rendelkező bentlakás(ok)hoz szúrjunk be 5 darab 1 ágyas szobát!

--valtozokkal
GO
CREATE PROCEDURE tizenegy (
	@szobaTnev VARCHAR(30),
	@dbAgy INT,
	@szobakSz INT,
	@dbbesz INT
)
AS BEGIN
	IF NOT EXISTS(SELECT * FROM SzobaTipusok WHERE SzobaTipusok.AgyakSzama=@dbAgy)
	INSERT INTO SzobaTipusok Values( (
		SELECT MAX(SzobaTipusID)+1 
		FROM SzobaTipusok),
		@szobaTnev, @dbAgy, 300
)

	DECLARE @szt INT;

	(SELECT @szt=SzobaTipusID 
	FROM SzobaTipusok
	WHERE AgyakSzama=@dbAgy)
	
	INSERT INTO Szobak(BentlakasID,SzobaTipusID,SzobakSzama)
	SELECT BentlakasID, @szt,@dbbesz
	FROM Bentlakasok
	WHERE SzobaSzam>@szobakSz
END
GO


/*
12
A biológia szakos diákokat költöztessük a ‘Maggio’ bentlakásba, és a történelem szakosokat a ‘Kshlerin and Sons’ bentlakásba!
*/
--tarolt eljarassal
GO
CREATE PROCEDURE tizenketto (
	@b VARCHAR(30), 
	@sz VARCHAR(30)
)
AS BEGIN
	SET NOCOUNT ON

	DECLARE @b1 INT;
	DECLARE @sz1 INT;

	SELECT @b1=BentlakasID
	FROM Bentlakasok
	WHERE Nev LIKE @b

	SELECT @sz1=SzakID
	FROM Szakok
	WHERE SzakNev LIKE @sz

	UPDATE Lakik
	SET BentlakasID =@b1
	WHERE DiakID IN
	(
		SELECT DiakID
		FROM Diakok
		WHERE SzakID =@sz1
	)
END
GO

DECLARE @szam VARCHAR(12) ='000000000';
EXEC kilenc'Kreiger, Thiel and Schmeler', @szam

EXEC tiz 'Layla Latimer'

EXEC tizenegy '1 agyas',1,100,5

EXEC tizenketto 'Maggio','biologia'
EXEC tizenketto 'Kshlerin and Sons', 'tortenelem'
