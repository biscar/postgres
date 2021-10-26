CREATE DATABASE olimpic;

create table if not exists athlete_events
(
	id serial
		constraint athlete_events_pk
			primary key,
	athlete_id integer not null,
	name char(128) not null,
	sex char not null,
	age integer,
	height integer,
	weight integer,
	team char(128),
	noc char(3),
	games char(12),
	season char(12),
	year integer,
	city char(128),
	sport char(128),
	event char(128),
	medal char(12)
);

alter table athlete_events owner to postgres;

create unique index if not exists athlete_events_id_uindex
	on athlete_events (id);
