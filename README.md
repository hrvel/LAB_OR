# PRVA LABORATORIJSKA VJEŽBA - OR

<h4 >  Baza podataka i licenca  </span> <h4>
Baza podataka FIFA sadrži podatke o nogometnom savezu FIFA te njegovim konfederacijima i članicama.<br />
Baza podataka je licencirana pod 'GNU General Public License v3.0'. <br />
Navedena licenca omogućava dijeljenje, mijenjanje, korištenje u komercijalne svrhe navedene podatke.<br />
  <hr style="border:2px solid grey">
<h4> Radna okolina <h4>
Bazu podataka koju koristim za spremanje podataka je MySQL te DBMS koji koristim je PgAdmin. <br />
Razlog koji koristim ovu radnu okolinu je to što zadovoljava sve funkcionalnosti koje su mi potrebne te što <br />
sam ovu okolinu imao instalirano prije početka rješavanja labosa.<br />
<hr style="border:2px solid grey">
<h4> Model podataka <h4>
Na donjoj slici nalazi se schema podataka.
FIFA kao krovna članica sadrži konfederacije (npr. UEFA). <br />
Svaka konfederacija sadrži države članice (npr. Hrvatska). <br />
Svaka država članica sadži klubova (npr. Osijek, Rijeka). <br />
Pri tome svaki od navedenih elemenata sadrži po više atributa <br />
Model se nalazi na (https://raw.githubusercontent.com/hrvel/LAB_OR/main/model.png)

<hr style="border:2px solid grey">
<h4> Izvoz podataka <h4>
Podatke iz baze podataka izvlačim na sljedeće načine :  <br />
<br />
1. korak Login na PSQL server <br/>
<br />
Kako bismo dobili ispis iz baze podataka u željenim CSV i JSON formatima <br />
potrebno je ulogirati se u PSQL lokalni server koristeći vlastito korisničko ime i lozinku. <br />
<br />
2. korak Spajanje na bazu <br />
<br />
Sljedeći korak je spajanje s bazom podataka, u mojem slučaju baza se zove OR. <br/>
 <br />
Daljnji koraci, <br />
<h4> Generiranje JSON-a <h4>
Nakon toga pokreće se skripta extract_to_json.sql (pritom se pazi na pozicioniranja u direktorijima).  <br />
Unutar skripte extract_to_json.sql postoji putanja u kojem se namješta gdje će se na računalu stvoriti tražena datoteka. <br />
Ukoliko netko isprobava ovu skriptu potrebno je promijeniti tu putanju.<br />
Ukoliko se na terminalu pojavi obavijest da je 'tuple off' potrebno je jos jednom izvrtiti naredbu ako 
želimo ispis svih redaka.  <br />
Dobiveni podaci imaju preko 10 objekata i preko 1 relacije roditelj-dijete što zadovoljava uvjete predaje. <br/>

<h4> Generiranje CSV-a <h4>
Ukoliko se iz baze želi izgenerirati CSV datoteka potrebno je u PSQL serveru pokrenuti datoteku extract_to_csv.sql.  <br />
Unutar skripte se nalazi putanja do izlazne datoteke u kojoj će biti spremljen CSV zapisi. <br />
Ukoliko netko poželi izvršiti ovu skriptu potrebno je izmijeniti željenu putanju. <br />
Dobiveno polje ima 19 redaka i preko 10 atributa što zadovoljava uvjete predaje. <br />

<h4> 'Dump' baze <h4>
Potrebno je izlogirati se sa PSQL servera. <br />
Ako se želi dobiti dump baze potrebno je pozvati naredbu oblika : <br />
pg_dump -U username db_name > dest_path/dump.sql. <br />
<hr style="border:2px solid grey">
<h4> Usporedba CSV-a i JSON-a <h4> 
CSV je čitljivi ljudima nego JSON te zauzimaju manje mjesta. <br />
Međutim ne podržavaju hijerarhijske strukture podataka (kao što je ova baza).<br />
JSON podržava hijerarhijske strukture podataka te je jednostavniji za parsiranje u JavaScript objekte. <br />
Oba zapisa podataka su jednostavna za implementaciju. <br />
<hr style="border:2px solid grey">
 <h4> Pristupačnost podataka <h4> 
Omogućio sam da podaci budu pristupačni tako što sam napravio automatiziran ispis u CSV i JSON formate
te tako što sam priložio dump baze. Tako svatko ko pristupi ovim podacima može ih mijenati u vlastitom radnom okruženju.

