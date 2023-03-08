--VISTE!

set search_path to socialsport;
--1.
----la	definizione	di	una	vista Programma	che	per	ogni impianto e	mese 
--riassume tornei e eventi	
--che si svolgono in tale impianto,
--evidenziando in	particolare	per	ogni categoria il numero di	
--tornei, il numero	di	eventi,	il numero di partecipanti coinvolti
--e di quanti diversi corsi di studio,	
--la durata	totale (in termini	di minuti) di utilizzo e la percentuale di
--utilizzo rispetto alla	
--disponibilità complessiva (minuti	totali nel mese in	cui	l'impianto è utilizzabile)

create or replace view Programma as
select impianto.nome, categoria.denominazione, numEventi, duratamatch, numTornei, numPart, numCdS FROM Categoria
FULL JOIN numT on numT.denominazione=categoria.denominazione
FULL JOIN numEeD on numEeD.denominazione=categoria.denominazione
FULL JOIN numPart on numPart.denominazione=categoria.denominazione
FULL JOIN numCdS on numCdS.denominazione=categoria.denominazione
FULL JOIN impianto on impianto.nome=categoria.denominazione
group by impianto.nome, categoria.denominazione, numEventi, duratamatch, numTornei, numPart, numCdS;


CREATE VIEW numTprova AS
select count(evento.descrizionetorneo), evento.nomeimpianto, extract(month from evento.datasvolgimento) as data, evento.denominazionecat, evento.descrizionetorneo
from evento
group by evento.nomeimpianto, data, evento.denominazionecat, evento.descrizionetorneo

CREATE VIEW numT AS
SELECT categoria.denominazione , count(torneo.descrizione) numTornei from Categoria
JOIN evento on evento.denominazionecat =categoria.denominazione
join torneo on torneo.descrizione = evento.descrizionetorneo
WHERE torneo.descrizione IS NOT NULL
group by categoria.denominazione;


CREATE VIEW numEeD AS
SELECT categoria.denominazione, count(evento.id) numEventi, sum(esito.duratamatch) duratamatch from Categoria
JOIN evento on evento.denominazionecat=categoria.denominazione
join impianto on impianto.nome = evento.nomeimpianto
--FULL
JOIN esito on esito.id=evento.id
group by categoria.denominazione;


CREATE VIEW numCdS AS
SELECT categoria.denominazione, count(corsodistudio.cod) numCdS from Categoria
JOIN forum on forum.categoria=categoria.denominazione
join corsodistudio on corsodistudio.cod = forum.codicecorsodistudio
group by categoria.denominazione;


CREATE VIEW numPart AS
SELECT categoria.denominazione, count(iscrizione.id) numPart FROM Categoria
JOIN evento on evento.denominazionecat=categoria.denominazione
JOIN iscrizione on iscrizione.id=evento.id
group by categoria.denominazione;



CREATE VIEW impianti AS
SELECT categoria.denominazione, impianto.nome, extract(month from evento.datasvolgimento) FROM Categoria
JOIN evento on evento.denominazionecat=categoria.denominazione
JOIN impianto on impianto.nome=evento.nomeimpianto
group by categoria.denominazione, impianto.nome, evento.datasvolgimento;



create or replace view archivio as
select impianto.nome, extract(month from evento.datasvolgimento), categoria.denominazione, evento.id, torneo.descrizione, corsodistudio.cod, esito.duratamatch, categoria.numgiocatori
from evento
join impianto on impianto.nome = evento.nomeimpianto
full join torneo on torneo.descrizione = evento.descrizionetorneo
join categoria on categoria.denominazione = evento.denominazionecat
join forum on forum.categoria = categoria.denominazione
join corsodistudio on corsodistudio.cod = forum.codicecorsodistudio
join esito on esito.idevento = evento.id
group by evento.id, impianto.nome, evento.datasvolgimento, torneo.descrizione, categoria.denominazione, corsodistudio.cod, esito.duratamatch, categoria.numgiocatori


--2.Programma Torneo


create or replace view arbitri as
select iscrizione.evento, iscrizione.usernameutente as arbitro from iscrizione 
where arbitro = true



create or replace view programmatorneo as
select distinct evento.descrizionetorneo, evento.id, evento.datasvolgimento, evento.nomeimpianto, esito.risultato as score, iscrizione.usernameutente as partecipante, arbitri.arbitro as arbitrataDa from evento
join iscrizione on iscrizione.evento = evento.id
join esito on esito.idEvento = evento.id
full join arbitri on arbitri.evento = iscrizione.evento
where iscrizione.arbitro is false
group by evento.descrizionetorneo, evento.id, evento.datasvolgimento, evento.nomeimpianto, score, partecipante, arbitrataDa
order by evento.descrizionetorneo, evento.id, evento.datasvolgimento asc




--definizione di una vista medagliere che per ogni categoria riporti le squadre e i singoli vincitori del maggior numero
--di trofei	o comunque delle migliori prestazioni nei tornei di	quella categoria e i corsi di studio i cui studenti si sono 
--comportati complessivamente meglio in eventi di quella categoria



create or replace view medagliere as
select max (registro.punti) as punteggio, count(premi) as numtrofei, username, denominazionecat, sicandida.nomesq, partecipa.descrtorn, corsodistudio.nome from registro
join utente on utente.username = registro.usernameutente
join sicandida on sicandida.usernameutente = utente.username
join squadra on squadra.nome = sicandida.nomesq
join partecipa on partecipa.nomesq = squadra.nome
join torneo on torneo.descrizione = partecipa.descrtorn
join corsodistudio on corsodistudio.cod = utente.codicecorsodistudio
group by denominazionecat, corsodistudio.nome, username, sicandida.nomesq, partecipa.descrtorn
order by denominazionecat, corsodistudio.nome,sicandida.nomesq, partecipa.descrtorn, username











