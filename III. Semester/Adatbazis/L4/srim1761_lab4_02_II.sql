/*
--1. Adjuk meg a legrégebben gyártott `Volkswagen`
	 márkájú autó(k) típusát! (Tipusok.TipusNev)
	 */
SELECT Tipusok.TipusNev, Autok.GyartasiEv into #tmp1
FROM Tipusok
JOIN Autok
ON Tipusok.TipusID = Autok.TipusID
JOIN Markak
ON Markak.MarkaID = Tipusok.MarkaID
WHERE Markak.MarkaNev LIKE '%Volkswagen%' 

declare @min INT = (select min (#tmp1.GyartasiEv) from #tmp1)

select #tmp1.TipusNev
from #tmp1
where #tmp1.GyartasiEv = @min

drop table #tmp1

/*2. Adjuk meg autótípusokon belül az 
	autók számát! (Tipusok.TipusNev, AutokSzama)*/

select t.TipusNev, count(a.AutoKod)
from Tipusok as t
join Autok as a on a.TipusID = t.TipusID
group by t.TipusNev


/*3. Adjuk meg autómárkákon belül típusok szerint az 
	autók átlagos napidíját! (Markak.MarkaNev, Tipusok.TipusNev, AtlagNapidij)*/
	 

select Markak.MarkaNev, Tipusok.TipusNev, avg(Autok.NapiDij) 
from Markak
join Tipusok
on Tipusok.MarkaID = Markak.MarkaID
join Autok
on Autok.TipusID  = Tipusok.TipusID
group by Markak.MarkaNev, Tipusok.TipusNev


/*
4. Adjuk meg azon autómárkákat, melyek esetén az autók 
	értékelésének (Csillag) minimuma NEM kisebb, mint 2! (Markak.MarkaNev)
	*/

select Markak.MarkaNev, min(Autok.Csillag) as m into #tmp2
from Markak
join Tipusok
on Tipusok.MarkaID = Markak.MarkaID
join Autok
on Autok.TipusID = Tipusok.TipusID
group by Markak.MarkaNev

select #tmp2.MarkaNev 
from #tmp2
where #tmp2.m >2

drop table #tmp2
----------------------------------------------------------------------------
select Markak.MarkaNev--, min(Autok.Csillag) as m 
from Markak
join Tipusok
on Tipusok.MarkaID = Markak.MarkaID
join Autok
on Autok.TipusID = Tipusok.TipusID
group by Markak.MarkaNev
having min(autok.Csillag) > 2
/*
5. Adjuk meg azon személyeket, akik az elmúlt egy évben	
	(aktuális naphoz viszonyítva!) min 2x bérelték ki a legdrágább 
	autót (NapiDij szerint)! (Berlok.SzemSzam, Berlok.Nev)
	*/



--SELECT Berlok.BerloID , Berlok.Nev 
SELECT Berlok.BerloID , Berlok.Nev , Autok.NapiDij INTO #TMP3
FROM Berlok
JOIN Berel
ON Berel.BerloID = Berlok.BerloID
JOIN Autok
ON Autok.AutoKod = Berel.AutoKod
GROUP BY Berlok.BerloID , Berlok.Nev, Autok.NapiDij
HAVING Autok.NapiDij = MAX(Autok.NapiDij)

/*

6. Adjuk meg azon bérlőket, akik egyetlen autót sem 
	béreltek ki! (Berlok.Nev)

*/


SELECT Berlok.Nev
FROM Berlok
LEFT JOIN Berel
ON Berlok.BerloID = Berel.BerloID
WHERE Berel.BerloID IS NULL

/*
7. Adjuk meg azon autótípus(oka)t, amely(ek) esetén 
	minden színből válogathatunk! (Tipusok.TipusNev)
*/

DECLARE @COLORNUM int

SELECT @COLORNUM = COUNT(Szinek.SzinKod)
FROM Szinek

SELECT Tipusok.TipusNev
FROM Tipusok, Autok
WHERE Tipusok.TipusID=Autok.TipusID
GROUP BY TipusNev
HAVING COUNT(DISTINCT SzinKod)=@COLORNUM

/*
8. Rendezzük növekvő sorrendbe az egyes autótípusokat aszerint,
	 hogy összességében milyen árban bérelték ki őket 
	(Berel tábla Ar mezőjét figyelembe véve)! (Tipus.Nev, OsszBerlesAr)
*/
SELECT TipusID, sum(Ar) AS OsszBerlesAr INTO #TAB1
FROM Berel, Autok
WHERE Berel.AutoKod=Autok.AutoKod
GROUP BY TipusID
	
SELECT TipusNev, OsszBerlesAr
FROM Tipusok,#TAB1
WHERE Tipusok.TipusID=#TAB1.TipusID
ORDER BY OsszBerlesAr

DROP TABLE #TAB1













