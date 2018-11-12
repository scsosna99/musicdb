create table artist (
	artist_nbr smallint        PRIMARY KEY,
	last_nm    varchar(30)     not null,
	first_nm   varchar(30),
        CHECK (artist_nbr > 0));
create unique index artist_1 on artist (last_nm, first_nm);
read c:\dosapps\music\data\artist.dat
