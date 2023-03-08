set search_path to "socialsport";


--1. utenti di Scienze Biologiche che hanno pubblicato post su categoria: calcio
select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 3 and forum.categoria = 'Calcio'
	order by cognome;
	
--2. utenti di fisica che hanno pubblicato post su categoria: calcio
select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 5 and forum.categoria = 'Calcio'
	order by cognome;

--3. utenti di economia e commercio che hanno pubblicato post su categoria: calcio
select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 9 and forum.categoria = 'Calcio'
	order by cognome;
	
--4. utenti di economia e commercio che hanno pubblicato post su categoria: pallavolo
	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 9 and forum.categoria = 'Pallavolo'
	order by cognome;
	
--5. utenti di scienze ambientali che hanno pubblicato post su categoria: pallavolo
	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 7 and forum.categoria = 'Pallavolo'
	order by cognome;

--6. utenti di matematica che hanno pubblicato post su categoria: pallavolo
 	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 1 and forum.categoria = 'Pallavolo'
	order by cognome;

--7. utenti di scienze biologiche che hanno pubblicato post su categoria: pallavolo
	select distinct UTENTE.username, matricola, nome, cognome from UTENTE
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 3 and forum.categoria = 'Pallavolo'
	order by cognome;
	
--8. utenti di scienze ambientali che hanno pubblicato post su categoria: tennis a squadre
	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 7 and forum.categoria = 'Tennis A Squadre'
	order by cognome;

--9. utenti di scienze biologiche che hanno pubblicato post su categoria: Tennis A Squadre
	select distinct UTENTE.username, matricola, nome, cognome from UTENTE
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 3 and forum.categoria = 'Tennis A Squadre'
	order by cognome;

--10. utenti di fisica che hanno pubblicato post su categoria: Tennis A Squadre
	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 5 and forum.categoria = 'Tennis A Squadre'
	order by cognome;
	
--11. utenti di scienze geologiche che hanno pubblicato post su categoria: Tennis A Squadre
 	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 4 and forum.categoria = 'Tennis A Squadre'
	order by cognome;

--12. utenti di matematica che hanno pubblicato post su categoria: Tennis A Squadre
	select distinct utente.username, matricola, nome, cognome from utente
	join post on post.usernameutente = utente.username
	join forum on forum.id = post.idforum
	where forum.codicecorsodistudio = 1 and forum.categoria = 'Tennis A Squadre'
	order by cognome;

--13. categorie	per	cui	ci sono	eventi non ancora chiusi in	programma in un	certo impianto
select denominazionecat, evento.id, evento.datasvolgimento, evento.nomeimpianto from EVENTO
	join impianto on impianto.nome = evento.nomeimpianto
	where evento.stato = true;
	
--14. per ogni categoria, viene mostrato il numero totale di adesioni
select denominazionecat, count (iscrizione.id) as adesioni from evento
	join iscrizione on iscrizione.evento = evento.id
	where evento.denominazionecat = 'calcio'
	group by evento.denominazionecat
union
select denominazionecat, count (iscrizione.id) as adesionipallavolo from evento
	join iscrizione on iscrizione.evento = evento.id
	where evento.denominazionecat = 'pallavolo'
	group by evento.denominazionecat
union
select denominazionecat, count (iscrizione.id) as adesionitennisasquadre from evento
	join iscrizione on iscrizione.evento = evento.id
	where evento.denominazionecat = 'Tennis A Squadre'
	group by evento.denominazionecat

--15 Determinare gli utenti che si sono candidati come	arbitri ma non come giocatori in un determinato evento
SELECT DISTINCT usernameutente, id FROM iscrizione
WHERE arbitro='true';

--16 Determinare gli utenti che si	sono candidati come giocatori ma non come arbitri in un determinato evento
SELECT DISTINCT usernameutente, id FROM iscrizione
WHERE arbitro='false';

--17 Determinare gli utenti che hanno ricevuto una valutazione superiore alla media
SELECT DISTINCT utentevotato FROM valutazione
WHERE voto > (SELECT AVG(voto) FROM Valutazione)
ORDER BY utentevotato ASC;

--18 Determinare gli utenti che hanno ricevuto una valutazione superiore alla media per quell'evento
SELECT DISTINCT utentevotato FROM valutazione
NATURAL JOIN valutazione V
WHERE voto > (SELECT AVG(voto) FROM valutazione WHERE idevento=V.idevento)
ORDER BY utentevotato ASC;

--19 Determinare gli utenti per i quali esiste una valutazione molto negativa (inferiore a 5) per quell'evento
SELECT DISTINCT utentevotato FROM valutazione
NATURAL JOIN valutazione V
WHERE EXISTS (SELECT * FROM valutazione WHERE idevento=V.idevento AND voto<5)
ORDER BY utentevotato ASC;






