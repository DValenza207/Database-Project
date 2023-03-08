
create schema "socialsport";
set search_path to "socialsport";
set datestyle to "YMD";

-- Categoria (Denominazione, Num. Giocatori, Regolamento, Foto, Id Forum)
create table Categoria(
	denominazione varchar(25) primary key,
	numgiocatori numeric(2),
	regolamento varchar(300),
	foto varchar (50) not null
	);

-- Corso Di Studio (Cod, Nome)
create table Corsodistudio(
	cod numeric(5) primary key,
	nome varchar(30) not null
	);

-- Esito (Id, DataInserimento, DurataMatch, Risultato, ComposizioneSq, NomiSquadre, Username Utente, Id Evento)
create table Esito(
	id numeric(10) primary key,
	datainserimento date not null,
	duratamatch time(2) not null,
	risultato varchar(5) not null,
	composizionesq varchar(50) not null,
	nomisquadre varchar(22) not null
);

-- Evento (Id, DataSvolgimento, Stato, Denominazione Categoria, Nome Impianto, Descrizione 0Torneo, Username Utente)
create table Evento(
	id numeric(10) primary key,
	datasvolgimento date not null,
	stato boolean not null
	);

-- Forum (Id, Cod CorsoDiStudio )
create table Forum(
	id numeric(10) primary key
	);

-- Impianto (Nome, Via, Tel, E-mail, Coordinate)
create table Impianto(
	nome varchar(50) primary key,
	via varchar(50) not null,
	tel numeric(15) not null,
	email varchar(256),
	coordinate varchar(14) not null
	);

-- Iscrizione (Id, Data, Stato, Arbitro,  Username Utente, Id Evento)
create table Iscrizione(
	id numeric(10) primary key,
	data date not null,
	stato boolean not null,
	arbitro boolean not null
	);

-- Post (Id, Data, Testo, Foto0, Id Forum, Username Utente)
create table Post(
	id numeric (10) primary key,
	data date not null,
	testo varchar (270) not null,
	foto varchar(20)
	);

-- Registro (Id, Punti, Username Utente, Id Esito, DenominazioneCategoria )
create table Registro(
	id varchar(10) primary key,
	punti numeric(4) not null
	);

-- Squadra (Nome, NumeroPartecipanti, ColoreMaglia, Descrizione)
create table Squadra(
	nome varchar(20) primary key,
	numeropartecipanti numeric(2) not null,
	coloremaglia varchar(15) not null,
	descrizione varchar(60) not null
	);

-- Torneo (Descrizione, Tipologia, Sponsor, Premi, Username Utente)
create table Torneo(
	descrizione varchar(60) primary key,
	aSquadre boolean not null,
	sponsor varchar(30),
	premi varchar(30)
);

-- Utente (Username, Nome, Cognome, Nascita,  Matricola, Password, Tel, Foto, Premium, CodCorsoDiStudio)
create table Utente(
	username varchar(15) primary key,
	nome varchar(20) not null,
	cognome varchar(20) not null,
	nascita varchar(40) not null,
	matricola numeric(10) not null,
	password varchar(15) not null,
	telefono numeric(15) not null,
	foto varchar(50) not null,
	premium boolean not null
	);

-- Valutazione (Id, Data, Voto, Id Evento, Username Utente, Username Utente)
create table Valutazione(
	id numeric(10) primary key,
	data date not null,
	voto numeric(2) not null
	);


-- associazioni

-- Partecipa (Nome Squadra, Descrizione Torneo)
create table Partecipa(
	nomeSq varchar(20) references Squadra(nome) on update cascade on delete cascade,
	descrTorn varchar(60) references Torneo(descrizione) on update cascade on delete cascade
	);

-- SiCandida (Nome Squadra, Username Utente)
create table SiCandida(
	nomeSq varchar(20) references Squadra(nome) on update cascade on delete cascade,
	usernameutente varchar(15) references Utente(username) on update cascade on delete cascade
	);
alter table SiCandida
    add Approvato boolean;
-- chiavi esterne

alter table Esito
	add inseritoDa varchar(15) references Utente(username) on update cascade on delete cascade,
	add idEvento numeric(10) references Evento(id) on update cascade on delete cascade;


alter table Evento
	add denominazioneCat varchar(25) references Categoria(denominazione) on update cascade on delete cascade,
	add nomeImpianto varchar(50) references Impianto(nome) on update cascade on delete cascade,
	add descrizioneTorneo varchar(60) references Torneo(descrizione) on update cascade on delete cascade,
	add realizzatoDa varchar(15) references Utente(username) on update cascade on delete cascade;

alter table Forum
	add codiceCorsodistudio numeric(5) references Corsodistudio(cod) on update cascade on delete cascade,
	add categoria varchar(25) references Categoria(denominazione) on update cascade on delete cascade;

alter table Iscrizione
	add usernameutente varchar(15) references Utente(username) on update cascade on delete cascade,
	add evento numeric(10) references Evento(id) on update cascade on delete cascade;

alter table Post
	add idforum numeric(10) references Forum(id)  on update cascade on delete cascade,
	add usernameutente varchar(15) references Utente(username) on update cascade on delete cascade;

alter table Registro
add usernameutente varchar(15) references Utente(username) on update cascade on delete cascade,
add idesito numeric(10) references Esito(id) on update cascade on delete cascade,
add denominazioneCat varchar(25) references Categoria(denominazione) on update cascade on delete cascade;

alter table Torneo
	add programmatoDa varchar(15) references Utente(username) on update cascade on delete cascade;

alter table Utente
	add codicecorsodistudio numeric(5) references Corsodistudio(cod) on update cascade on delete cascade;

alter table Valutazione
	add idevento numeric(10) references Evento(id) on update cascade on delete cascade,
	add utentevotante varchar(15) references Utente(username) on update cascade on delete cascade,
	add utentevotato varchar(15) references Utente(username) on update cascade on delete cascade;

