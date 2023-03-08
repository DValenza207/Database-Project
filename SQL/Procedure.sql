set search_path to 'socialsport';

--fa diventare torneo un'attività data, prendendo in Input la descrizione ed il tipo del torneo

create or replace function upgradeEvent (IN idEventoDaModificare varchar(20), descrizionenuovotorneo varchar(20))returns void as
$$
begin
	if (idEventoDaModificare not in (select id from evento
													where descrizionetorneo = null))
	then raise exception 'L evento è già torneo.';
	else
	update evento set descrizionetorneo = descrizionenuovotorneo where idEventoDaModificare = evento.id;
end if;
end;
$$ language plpgsql;


--se un utente candidato ad un evento ha valutazioni positive, viene accettato automaticamente
create or replace function acceptNow (IN activeUsername varchar(20), nuovaIscrizione boolean) returns void as
$$
begin
	if (activeUsername not in (select utentevotato from valutazione
											where valutazione.voto > 5))
	then raise exception 'Questo utente deve essere accettato manualmente.';
	else
	update iscrizione set iscrizione.stato = nuovaIscrizione where activeUsername = iscrizione.utentevotato; 
end if;
end;
$$ language plpgsql; 

--funzione che dato un evento in un torneo lo cancella dal torneo
create or replace function deleteEvent (IN idEventoDaModificare varchar(20), descrizionenuovotorneo varchar(20))returns void as
$$
begin
	if (idEventoDaModificare in (select id from evento
													where descrizionetorneo = null))
	then raise exception 'L evento è già torneo.';
	else
	update evento set descrizionetorneo = null where idEventoDaModificare = evento.id;
end if;
end;
$$ language plpgsql;

--dato un id di Iscrizione, tale iscrizione viene impostata come chiusa
create or replace function chiusura_iscrizione(IN newIscrizione varchar (8)) returns void
as $$
begin
if ((newIscrizione) in (select Iscrizione.id from Iscrizione))
then
	update Iscrizione
	set Iscrizione.stato='false'
	where iscrizione.id=newIscrizione;
else raise exception 'questa iscrizione non esiste';
end if;
end;
$$ language plpgsql;


--un impianto cambia il suo numero di telefono
create or replace function changeNumber(IN newNum integer, IN idImpianto varchar(8)) returns void
as $$
begin 
IF idImpianto NOT IN (SELECT nome FROM Impianto)
	THEN
	RAISE EXCEPTION 'questo impianto non esiste!';
ELSE UPDATE Impianto SET tel=newNum WHERE Impianto.nome=idImpianto;
		RAISE NOTICE 'ok!';
END IF;
END;
$$
language plpgsql;

--cambia la data di svolgimento di un evento
create or replace function changeDate(IN newDate date, IN idEvento numeric(10)) returns void
as $$
begin 
IF idEvento NOT IN (SELECT id FROM Evento)
	THEN
	RAISE EXCEPTION 'questo evento non esiste!';
ELSE UPDATE Evento SET datasvolgimento=newDate WHERE Evento.id=idEvento;
		RAISE NOTICE 'ok!';
END IF;
END;
$$
language plpgsql;