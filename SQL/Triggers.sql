--TRIGGERS

set search_path to socialsport;



--1.Un utente deve candidarsi ad una sola squadra alla volta
-- OK

create or replace function CandidaturaUnicaAux() returns trigger as $$
begin
      if (new.usernameUtente in (select usernameUtente from SiCandida))
      then 
			update SiCandida set nomeSq=new.nomeSq
				where usernameUtente=new.usernameUtente;
			update SiCandida set approvato=true
				where usernameUtente=new.usernameUtente;
			raise notice '% cambio di candidatura', new.nomeSq;
			return new;
     else
		return new;
       end if;
end;
$$ language plpgsql;

create trigger CandidaturaUnica
after insert on SiCandida 
for each row
execute procedure CandidaturaUnicaAux();
--drop trigger candidaturaunica on sicandida
insert into SiCandida values('squadra1','Ale');
insert into SiCandida values('squadra2','Ale');


--10.Gli utenti si possono iscrivere solo se l’evento è APERTO
-- OK

create or replace function EventoApertoAux() returns trigger as $$
begin
if (
	(select evento.stato from evento
	join iscrizione on iscrizione.evento = evento.Id
	where iscrizione.id=new.id) = false
)
	then
		raise exception 'l evento è pieno';
	else
		return new;
	end if;
end;

$$ language plpgsql;

create trigger EventoAperto
after insert or update on Iscrizione
for each row
execute procedure EventoApertoAux();

--drop trigger EventoAperto on Iscrizione;

insert into Iscrizione (id, data, stato, arbitro, usernameutente, evento) 
values(11, '2016-06-29', false, false, 'Ale', 1);


--6.Il punteggio della valutazione può essere tra 0 e 10
-- OK

create or replace function ControllaPunteggioAux() returns trigger as $$
begin
if (
      (select valutazione.voto from valutazione
	   where valutazione.id = new.id) < 0
	OR
      (select valutazione.voto from valutazione
	   where valutazione.id = new.id) > 10
	)
then
	raise exception 'il voto deve essere compreso tra 0 e 10!';
else 
     return new;
	 end if;
end;	   
	   
$$ language plpgsql;

create trigger ControllaPunteggio
after insert or update on Valutazione
for each row
execute procedure ControllaPunteggioAux();

insert into Valutazione values(9, '2016-07-22', 9, 1, 'Fel', 'Arc');


--4.Data inserimento di esito deve essere posteriore alla data di svolgimento dell'evento
-- OK
create or replace function ControllaDataAux() returns trigger as $$
begin
if( 
	(select esito.datainserimento from esito
     where esito.id=new.id) <
		(select evento.datasvolgimento from evento
		join esito on esito.id=evento.id
		where esito.id=new.id)
)	
	then
	  	 raise exception 'la data di inserimento di esito deve essere posteriore a quella dello svolgimento di evento!';
    else
	       return new;
    end if;
end;

$$ language plpgsql;

create trigger ControllaData
after insert or update on esito
for each row
execute procedure ControllaDataAux();
--drop trigger controlladata on esito
insert into Esito values(3, '2017-01-23', '00:40:00', '2-1', 'composizionesquadra1.txt', 'NomeSquadra1', NULL, 2);
--delete from esito where id=3


--3.Il numero totale di utenti arbitri confermati non può essere maggiore di uno per un dato evento, ma può essere opzionale
--OK
create or replace function NonPiùDiUnArbitroAux() returns trigger as $$
begin
if(  
	new.arbitro = true --mi dice se sono arbitro
	AND
	(select count(iscrizione.arbitro) from iscrizione
     join evento on evento.id = iscrizione.id  
     where iscrizione.arbitro=new.arbitro)>0
	--se mi iscrivo come arbitro e però ce n'è già uno -> exception
)
  then 
	       raise exception 'ci deve essere al massimo un arbitro!';
	 else 
		   return new;
	 end if;
end;

$$ language plpgsql;

create trigger NonPiùDiUnArbitro
after insert or update on iscrizione 
for each row
execute procedure NonPiùDiUnArbitroAux();

--drop trigger NonPiùDiUnArbitro on iscrizione

insert into Iscrizione values(20, '2016-07-09', true, true, NULL, 2);
insert into Iscrizione values(21, '2016-07-09', true, true, NULL, 1);

