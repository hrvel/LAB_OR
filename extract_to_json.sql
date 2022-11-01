WITH 
klub AS (
	SELECT *
	FROM "Klubovi" as k
),

klub_bez_ID AS 
(
	SELECT kl."Ime Kluba", kl."Godina osnutka Kluba", kl."Trener", kl."Stadion"
	FROM "Klubovi" as kl
),

član AS (
SELECT "Ime članice" as Država,
	"Predsjednik članice" as Predsjednik,
	"Godina osnutka članice" as Godina_Osnutka,
	"Godina pristupanja članice" as Godina_Pristupanja,
	"fk_KonfederacijaID" as konf_ID,
	json_agg(json_build_object('Klub', ke."Ime Kluba", 'Godina osnutka', ke."Godina osnutka Kluba", 'Trener',  ke."Trener", 'Stadion',  ke."Stadion")) AS Klubovi
FROM "Članice" cl
JOIN klub ke
ON (cl."ČlanicaID" = ke."ID_članice")
GROUP BY "Ime članice","Predsjednik članice","Godina osnutka članice","Godina pristupanja članice", "fk_KonfederacijaID"
),

 konfederacija_ag AS (
 SELECT "Ime Konfederacija" as konfederacija,
	 "Predsjednik Konfederacije" as predsjednik,
	 "Regija" as podrucje_djelovanja,
	 "Godina osnutka Konfederacije" as godina_osnutka,
     json_agg(json_build_object('Država', cl_23.država,'Godina osnutka', cl_23.godina_Osnutka, 'Predsjednik',  cl_23.predsjednik, 'Godina pristupanja',  cl_23.godina_pristupanja, 'klubovi', cl_23.klubovi)) as Članovi
     FROm "Konfederacije" kf
     JOIN član cl_23
     ON (cl_23.konf_ID = kf."KonfederacijaID")
     GROUP BY "Ime Konfederacija", "Predsjednik Konfederacije", "Regija", "Godina osnutka Konfederacije"
 )
\t
\a
\o '/home/elez/Desktop/FER7/OR/LAB/Lab1/FIFA.json' 
 SELECT json_agg(konfederacija_ag) from konfederacija_ag;