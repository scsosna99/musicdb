drop table artist_xref;
create table artist_xref (
	cd_nbr     number (3,0) not null,
	song_nbr   number (3,0),
	artist_nbr number (3,0) not null);
@xref1.dat
@xref2.dat
create unique index artist_xref_0 on artist_xref (cd_nbr, song_nbr, artist_nbr);
