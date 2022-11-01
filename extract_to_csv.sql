drop table temp_table;

create table temp_table as	
	SELECT Konf."Ime Konfederacija", Konf."Predsjednik Konfederacije", Konf."Regija", Konf."Godina osnutka Konfederacije",
	"Članice"."Ime članice","Članice"."Predsjednik članice", "Članice"."Godina osnutka članice", "Članice"."Godina pristupanja članice",
	"Klubovi"."Ime Kluba","Klubovi"."Godina osnutka Kluba","Klubovi"."Stadion","Klubovi"."Trener" 
	FROM "Konfederacije" as Konf 
	JOIN "Članice" ON  Konf."KonfederacijaID" = "Članice"."fk_KonfederacijaID" JOIN "Klubovi" ON "Klubovi"."ID_članice" = "Članice"."ČlanicaID";
\copy temp_table to '/home/elez/Desktop/FER7/OR/LAB/Lab1/FIFA.csv' csv header;