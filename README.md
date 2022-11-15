# PRVA LABORATORIJSKA VJEŽBA - OR

<h3> Baza podataka i licenca <h3>
Baza podataka FIFA sadrži podatke o nogometnom savezu FIFA te njegovim konfederacijima i članicama.<br />
Baza podataka je licencirana pod 'GNU General Public License v3.0'. <br />
Navedena licenca omogućava dijeljenje, mijenjanje, korištenje u komercijalne svrhe navedene podatke.<br />
<h3> Radna okolina <h3>
Bazu podataka koju koristim za spremanje podataka je MySQL te DBMS koji koristim je PgAdmin. <br />
Razlog koji koristim ovu radnu okolinu je to što zadovoljava sve funkcionalnosti koje su mi potrebne te što <br />
sam ovu okolinu imao instalirano prije početka rješavanja labosa.<br />

<h3> Model podataka <h3>
Na donjoj slici nalazi se schema podataka.
FIFA kao krovna članica sadrži konfederacije (npr. UEFA). Svaka konfederacija sadrži države članice (npr. Hrvatska). <br />
Svaka država članica sadži klubova (npr. Osijek, Rijeka). <br />
Pri tome svaki od navedenih elemenata sadrži po više atributa <br />
![Schema podataka](Slike/model.png)

<h3> Izvoz podataka <h3>
Podatke iz baze podataka izvlačim na sljedeće načine :
# login na psql server
Kako bismo dobili ispis iz baze podataka u željenim CSV i JSON formatima potrebno je ulogirati se u PSQL lokalni server koristeći vlastito
korisničko ime i lozinku. 
# spajanje na bazu
Sljedeći korak je spajanje s bazom podataka, u mojem slučaju baza se zove OR.
<h2> Generiranje **JSON**-a <h2>
Nakon toga pokreće se skripta extract_to_json.sql (pritom se pazi na pozicioniranja u direktorijima).
Unutar skripte extract_to_json.sql postoji putanja u kojem se namješta gdje će se na računalu stvoriti tražena
datoteka. Ukoliko netko isprobava ovu skriptu potrebno je promijeniti tu putanju.
Ukoliko se na terminalu pojavi obavijest da je 'tuple off' potrebno je jos jednom izvrtiti naredbu ako 
želimo ispis svih redaka. 
Dobiveni podaci imaju preko 10 objekata i preko 1 relacije roditelj-dijete što zadovoljava uvjete predaje.
<h2> Generiranje CSV-a <h2>
Ukoliko se iz baze želi izgenerirati CSV datoteka potrebno je u PSQL serveru pokrenuti datoteku extract_to_csv.sql.
Unutar skripte se nalazi putanja do izlazne datoteke u kojoj će biti spremljen CSV zapisi. Ukoliko netko poželi
izvršiti ovu skriptu potrebno je izmijeniti željenu putanju.
Dobiveno polje ima 19 redaka i preko 10 atributa što zadovoljava uvjete predaje.
<h2> 'Dump' baze <h2>
Potrebno je izlogirati se sa PSQL servera. <br />
Ako se želi dobiti dump baze potrebno je pozvati naredbu oblika : <br />
pg_dump -U username db_name > dest_path/dump.sql. <br />
Primjer se nalazi na slici.

