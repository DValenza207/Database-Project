
set search_path to "socialsport";

--insert into corso di studio (Cod, Nome)
insert into Corsodistudio values(1,'Matematica');
insert into Corsodistudio values(2,'Chimica');
insert into Corsodistudio values(3,'Scienze Biologiche');
insert into Corsodistudio values(4,'Scienze Geologiche');
insert into Corsodistudio values(5,'Fisica');
insert into Corsodistudio values(6,'Scienza Dei Materiali');
insert into Corsodistudio values(7,'Scienze Ambientali');
insert into Corsodistudio values(8,'Informatica');
insert into Corsodistudio values(9,'Economia E Commercio');
insert into Corsodistudio values(10,'Ingegneria Elettronica');
insert into Corsodistudio values(11,'Biotecnologie');
insert into Corsodistudio values(12,'Giurisprudenza');
insert into Corsodistudio values(13,'Filosofia');
insert into Corsodistudio values(14,'Lettere');
insert into Corsodistudio values(15,'Ingegneria Informatica');

--insert into Impianto (Nome, Via, Tel, E-mail, Coordinate)
insert into Impianto values('Palazzetto Dello Sport', 'viale Gambaro',  010234456, 'palazzettodellosport@gmail.com', 'N135156E456234');
insert into Impianto values('Stadio Luigi Ferraris', 'via Giovanni de Prà', 010237458, 'stadioluigiferraris@gmail.com', 'S165106O456234');
insert into Impianto values('Crocera Stadium', 'via Degola', 010334656, 'crocerastadium@gmail.com', 'N035156O456934');
insert into Impianto values('Foltzer', 'via Iori', 010784456, 'foltzer@gmail.com', 'N131151E455234');
insert into Impianto values('Istituto Don Bosco', 'via San Giovanni Bosco', 010798751, 'istitutodonbosco@gmail.com', 'S115156E656234');
insert into Impianto values('Campo Felice Ceravolo', 'via Bartolomeo Bianco', 010231417, 'campofeliceceravolo@gmail.com', 'N159156E406034');

--insert into Squadra (Nome, NumeroPartecipanti, ColoreMaglia, Descrizione)
insert into Squadra values('squadra1',2, 'rosso', 'descrizionesq1.txt');
insert into Squadra values('squadra2', 2, 'blu', 'descrizionesq2.txt');
insert into Squadra values('squadra3', 2, 'blallo', 'descrizionesq3.txt');
insert into Squadra values('squadra4', 2, 'giallo',  'descrizionesq4.txt');

--insert into Categoria (Denominazione, Num. Giocatori, Regolamento, Foto)
insert into Categoria values('Calcio', 11, 'Regolamento-Calcio.txt', 'foto-calcio.jpg');
insert into Categoria values('Pallavolo', 6, 'Regolamento-Pallavolo.txt', 'foto-pallavolo.jpg');
insert into Categoria values('Tennis In Singolo', 1, 'Regolamento-TennisInSingolo.txt', 'foto-TennisInSingolo.jpg');
insert into Categoria values('Tennis A Squadre', 2, 'Regolamento-TennisASquadre.txt', 'foto-TennisASquadre.jpg');
insert into Categoria values('Rugby', 15, 'Regolamento-Rugby.txt', 'foto-Rugby.jpg');
insert into Categoria values('Pallanuoto', 7, 'Regolamento-Pallanuoto.txt', 'foto-Pallanuoto.jpg');
insert into Categoria values('Basketball', 5, 'Regolamento-Basketball.txt', 'foto-Basketball.jpg');
insert into Categoria values('Hockey Su Ghiaccio', 6, 'Regolamento-HockeySuGhiaccio.txt', 'foto-HockeySuGhiaccio.jpg');
insert into Categoria values('Hockey Su Prato', 6, 'Regolamento-HockeySuPrato.txt', 'foto-HockeySuPrato.jpg');
insert into Categoria values('Pallamano', 7, 'Regolamento-Pallamano.txt', 'foto-Pallamano.jpg');
insert into Categoria values('Dodgeball', 6, 'Regolamento-Dodgeball.txt', 'foto-Dodgeball.jpg');
insert into Categoria values('Hitball', 5, 'Regolamento-Hitball.txt', 'foto-Hitball.jpg');
insert into Categoria values('Canottaggio A Squadre', 4, 'Regolamento-CanottaggioASquadre.txt','foto-CanottaggioASquadre.jpg');
insert into Categoria values('Atletica', 1, 'Regolamento-Atletica.txt','foto-Atletica.txt');
insert into Categoria values('Canottaggio In Singolo', 1, 'Regolamento-CanottaggioInSingolo.txt', 'foto-CanottaggioInSingolo.jpg');

--insert into Esito (Id, DataInserimento, DurataMatch, Risultato, ComposizioneSq, NomeSquadra, Username Utente, Id Evento)
insert into Esito values(1, '2017-07-23', '00:40:00', '2-1', 'composizionesquadra1.txt', 'NomeSquadra1', NULL, NULL);
insert into Esito values(2, '2018-01-25', '00:53:00', '0-2', 'composizionesquadra2.txt', 'NomeSquadra2', NULL, NULL);

--insert into Evento (Id, DataSvolgimento, Stato, Denominazione Categoria, Nome Impianto, Descrizione 0Torneo, Username Utente)
insert into Evento values(1, '2016-07-22', false, 'Tennis A Squadre', 'Campo Felice Ceravolo', NULL, NULL);
insert into Evento values(2, '2017-01-25', false, 'Tennis A Squadre', 'Campo Felice Ceravolo', NULL, NULL);
insert into Evento values(3, '2017-01-30', true, 'Tennis A Squadre', 'Campo Felice Ceravolo', NULL, NULL);
insert into Evento values(4, '2017-02-10', false, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
insert into Evento values(5, '2018-05-16', true, 'Pallavolo', 'Palazzetto Dello Sport', NULL, NULL);
insert into Evento values(6, '2018-05-29', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
--insert into Evento values(7, '2018-06-12', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
--insert into Evento values(8, '2018-06-23', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
--insert into Evento values(9, '2018-07-06', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
--insert into Evento values(10, '2018-07-31', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
--insert into Evento values(11, '2018-08-05', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);
--insert into Evento values(12, '2018-08-19', true, 'Calcio', 'Campo Felice Ceravolo', NULL, NULL);

--insert into Forum (Id, Cod CorsoDiStudio, denominazione Categoria)
insert into Forum values(01, 1, 'Tennis A Squadre');
insert into Forum values(02, 5, 'Tennis A Squadre');
insert into Forum values(03, 2, 'Calcio');
insert into Forum values(04, 7, 'Tennis A Squadre');
insert into Forum values(05, 4, 'Tennis A Squadre');
insert into Forum values(06, 3, 'Tennis A Squadre');
insert into Forum values(07, 10, 'Calcio');
insert into Forum values(08, 1, 'Calcio');
insert into Forum values(09, 9, 'Tennis A Squadre');
insert into Forum values(10, 14, 'Calcio');
insert into Forum values(11, 1, 'Pallavolo');
insert into Forum values(12, 3, 'Calcio');
insert into Forum values(13, 3, 'Pallavolo');
insert into Forum values(14, 5, 'Calcio');
insert into Forum values(15, 7, 'Pallavolo');
insert into Forum values(16, 9, 'Calcio');
insert into Forum values(17, 9, 'Pallavolo');

--insert into Iscrizione (Id, Data, Stato, Arbitro,  Username Utente, Id Evento)
insert into Iscrizione values(01, '2016-06-29', true, false, NULL, 1);
insert into Iscrizione values(02, '2016-06-29', true, false, NULL, 1);
insert into Iscrizione values(03, '2016-07-02', true, false, NULL, 1);
insert into Iscrizione values(04, '2016-07-02', true, false, NULL, 1);
insert into Iscrizione values(05, '2016-07-09', true, true, NULL, 1);
insert into Iscrizione values(06, '2016-07-09', true, true, NULL, 2);
insert into Iscrizione values(07, '2017-01-05', true, false, NULL, 2);
insert into Iscrizione values(08, '2017-01-05', true, false, NULL, 2);
insert into Iscrizione values(09, '2017-01-18', true, false, NULL, 2);
insert into Iscrizione values(10, '2017-01-18', true, false, NULL, 2);
insert into Iscrizione values(11, '2017-02-08', true, false, NULL, 4);
insert into Iscrizione values(12, '2017-02-09', true, false, NULL, 4);
insert into Iscrizione values(13, '2017-02-07', true, false, NULL, 4);
insert into Iscrizione values(14, '2017-02-06', true, false, NULL, 4);
insert into Iscrizione values(15, '2018-04-21', true, false, NULL, 5);
insert into Iscrizione values(16, '2018-04-22', true, false, NULL, 5);
insert into Iscrizione values(17, '2018-04-23', true, false, NULL, 5);
insert into Iscrizione values(18, '2018-05-03', true, false, NULL, 5);



-- insert into Post (Id, Data, Testo, Foto, Id Forum, Username Utente)
insert into Post values (01, '2016-08-25', 'ciao', 'foto1.jpg', 4, NULL);
insert into Post values (02,'2016-08-26', 'ciaone!', 'foto2.jpg', 5, NULL);
insert into Post values (03,'2016-08-26', 'we come va?', NULL, 01, NULL);
insert into Post values (04, '2016-08-27', 'lol', 'foto3.jpg', 6, NULL);
insert into Post values (05, '2016-09-16', 'testo 4', 'foto4.jpg', 11, NULL);
insert into Post values (06, '2016-11-05', 'testo 5', 'foto5.jpg', 12, NULL);
insert into Post values (07, '2017-08-27', 'testo 6', 'foto6.jpg', 13, NULL);
insert into Post values (08, '2017-08-27', 'testo 7', 'foto7.jpg', 14, NULL);
insert into Post values (09, '2017-09-27', 'testo 8', 'foto8.jpg', 15, NULL);
insert into Post values (10, '2018-07-25', 'testo 9', 'foto9.jpg', 16, NULL);
insert into Post values (11, '2018-08-27', 'testo 10', 'foto10.jpg', 17, NULL);
insert into Post values (12, '2018-11-23', 'testo 11', 'foto11.jpg', 2, NULL);

--insert into Registro (Id, Punti, Username Utente, Id Esito, DenominazioneCategoria )
insert into Registro values(1, 11, NULL, 1, 'Tennis A Squadre');
insert into Registro values(2, 09, NULL, 1, 'Tennis A Squadre');
insert into Registro values(3, 13, NULL, 1, 'Tennis A Squadre');
insert into Registro values(4, 14, NULL, 1, 'Tennis A Squadre');
insert into Registro values(5, 12, NULL, 2, 'Tennis A Squadre');
insert into Registro values(6, 5, NULL, 2, 'Tennis A Squadre');
insert into Registro values(7, 1, NULL, 2, 'Tennis A Squadre');
insert into Registro values(8, 8, NULL, 2, 'Tennis A Squadre');

--insert into Torneo (Descrizione, Tipologia, Sponsor, Premi, Username Utente)
insert into Torneo values('descrizione1.txt', true, 'sponsor1.txt', 'sconto iscrizione annuale 10%', NULL);
insert into Torneo values('descrizione2.txt', true, 'sponsor2.txt', 'sconto iscrizione annuale 20%', NULL);
insert into Torneo values('descrizione3.txt', true, 'sponsor3.txt', 'sconto iscrizione annuale 80%', NULL);

--insert into Utente (Username, Nome, Cognome, Nascita,  Matricola, Password, Tel, Foto, Premium, Cod CorsoDiStudio)
insert into Utente values('Damiaccio', 'Nome', 'Cognome', '1996-02-15', '4000004', 'Password1', '3338456456', 'DamiaccioFoto.jpg', true, 7);
insert into Utente values('Ale', 'Nome', 'Cognome', '1996-05-16', '4000020', 'Password2', '3331230562', 'AleFoto.jpg', false, 4);
insert into Utente values('oni', 'Nome', 'Cognome', '1996-02-22', '4000054', 'Password3', '3487564630', 'oniFoto.jpg', true, 1);
insert into Utente values('Cortana', 'Nome', 'Cognome', '1996-08-02', '4000072', 'Password4', '3330191023', 'CortanaFoto.jpg', true, 3);
insert into Utente values('MasterC', 'Nome', 'Cognome', '1996-10-24','4000080', 'Password5', '3485619060', 'MasterCFoto.jpg', false, 5);
insert into Utente values('Libbra', 'Nome', 'Cognome', '1996-06-30', '4000012', 'Password6', '3480651210', 'LibbraFoto.jpg', false, 9);
insert into Utente values('Arc', 'Nome', 'Cognome', '1996-03-18', '4000052', 'Password7', '3480651210', 'ArcFoto.jpg', false, 9);
insert into Utente values('Fel', 'Nome', 'Cognome', '1996-12-26', '4000076', 'Password8', '3480651210', 'FelFoto.jpg', false, 9);
insert into Utente values('Gemini', 'Nome', 'Cognome', '1996-5-15', '4000018', 'Password9', '3480651210', 'GeminiFoto.jpg', false, 9);

--insert into Valutazione (Id, Data, Voto, Id Evento, Username Utente, Username Utente)
insert into Valutazione values(1, '2016-07-22', 8, 1, 'Damiaccio', 'Cortana');
insert into Valutazione values(2, '2016-07-22', 2, 1, 'MasterC', 'oni');
insert into Valutazione values(3, '2017-01-25', 7, 2, 'Libbra', 'Ale');



-- Associazioni

-- partecipa
insert into partecipa values('squadra1', 'descrizione1.txt');
insert into partecipa values('squadra2', 'descrizione1.txt');
insert into partecipa values('squadra3', 'descrizione1.txt');
insert into partecipa values('squadra4', 'descrizione1.txt');

-- SiCandida
insert into SiCandida values('squadra1','Damiaccio');
insert into SiCandida values('squadra1','Ale');
insert into SiCandida values('squadra2','oni');
insert into SiCandida values('squadra2','Cortana');
insert into SiCandida values('squadra3','MasterC');
insert into SiCandida values('squadra3','Arc');
insert into SiCandida values('squadra4','Fel');
insert into SiCandida values('squadra4','Gemini');



--UPDATES
--SiCandida: 
update SiCandida set approvato=true where nomeSq='squadra1' and usernameutente='Damiaccio';
update SiCandida set approvato=true where nomeSq='squadra1' and usernameutente='Ale';
update SiCandida set approvato=true where nomeSq='squadra2' and usernameutente='oni';
update SiCandida set approvato=true where nomeSq='squadra2' and usernameutente='Cortana';
update SiCandida set approvato=true where nomeSq='squadra3' and usernameutente='MasterC';
update SiCandida set approvato=true where nomeSq='squadra3' and usernameutente='Arc';
update SiCandida set approvato=true where nomeSq='squadra4' and usernameutente='Fel';
update SiCandida set approvato=true where nomeSq='squadra4' and usernameutente='Gemini';
-- esito: utente, evento
update esito set inseritoDa='Libbra', idEvento=1 where id=1;
update esito set inseritoDa='Libbra', idEvento=2 where id=2;



-- evento: torneo, utente
update evento set descrizioneTorneo='descrizione1.txt', realizzatoDa='Libbra' where id=1;
update evento set descrizioneTorneo='descrizione1.txt', realizzatoDa='Libbra' where id=2;
update evento set descrizioneTorneo='descrizione1.txt', realizzatoDa='Libbra' where id=3;
update evento set descrizioneTorneo='descrizione2.txt', realizzatoDa='oni' where id=4;
update evento set descrizioneTorneo='descrizione2.txt', realizzatoDa='oni' where id=6;
update evento set descrizioneTorneo='descrizione3.txt', realizzatoDa='Cortana' where id=5;



-- iscrizione: utente
update iscrizione set usernameutente='Damiaccio', evento=1 where id=1;
update iscrizione set usernameutente='Ale', evento=1 where id=2;
update iscrizione set usernameutente='oni', evento=1 where id=3;
update iscrizione set usernameutente='Cortana', evento=1 where id=4;
update iscrizione set usernameutente='Libbra', evento=1 where id=5;
update iscrizione set usernameutente='Libbra', evento=2 where id=6;
update iscrizione set usernameutente='MasterC', evento=2 where id=7;
update iscrizione set usernameutente='Arc', evento=2 where id=8;
update iscrizione set usernameutente='Fel', evento=2 where id=9;
update iscrizione set usernameutente='Gemini', evento=2 where id=10;
update iscrizione set usernameutente='Damiaccio', evento=4 where id=11;
update iscrizione set usernameutente='Ale', evento=4 where id=12;
update iscrizione set usernameutente='oni', evento=4 where id=13;
update iscrizione set usernameutente='Gemini', evento=4 where id=14;
update iscrizione set usernameutente='Cortana', evento=5 where id=15;
update iscrizione set usernameutente='Libbra', evento=5 where id=16;
update iscrizione set usernameutente='Arc', evento=5 where id=17;
update iscrizione set usernameutente='Fel', evento=5 where id=18;

-- post: utente
update post set usernameutente='Damiaccio' where id=1;
update post set usernameutente='Ale' where id=2;
update post set usernameutente='oni' where id=3;
update post set usernameutente='Cortana' where id=4;
update post set usernameutente='oni' where id=5;
update post set usernameutente='Cortana' where id=6;
update post set usernameutente='Cortana' where id=7;
update post set usernameutente='MasterC' where id=8;
update post set usernameutente='Damiaccio' where id=9;
update post set usernameutente='Gemini' where id=10;
update post set usernameutente='Fel' where id=11;
update post set usernameutente='MasterC' where id=12;

-- registro: utente
update registro set usernameutente='Damiaccio' where id='1';
update registro set usernameutente='Ale' where id='2';
update registro set usernameutente='oni' where id='3';
update registro set usernameutente='Cortana' where id='4';
update registro set usernameutente='MasterC' where id='5';
update registro set usernameutente='Arc' where id='6';
update registro set usernameutente='Fel' where id='7';
update registro set usernameutente='Gemini' where id='8';



-- torneo: utente
update torneo set programmatoDa='Libbra' where descrizione='descrizione1.txt';
update torneo set programmatoDa='oni' where descrizione='descrizione2.txt';
update torneo set programmatoDa='Cortana' where descrizione='descrizione3.txt';
