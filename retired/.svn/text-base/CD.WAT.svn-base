create table cd (
	cd_nbr     smallint    not null PRIMARY KEY,
	cd_desc    varchar(55) not null,
	artist_nbr smallint    not null,
	label_cd   char(3)     not null,
	label_id   char(15)    not null,
	song_cnt   smallint    not null,
	cd_tm      char(5)     not null,
    code_1     char(3),
    FOREIGN KEY artist_nbr REFERENCES artist,
    FOREIGN KEY label_cd   REFERENCES cd_label,
    CHECK (cd_nbr > 0 AND song_cnt > 0 AND cd_tm LIKE '__:__'));
create index cd_1 on cd (artist_nbr);
create index cd_2 on cd (label_cd);
create index cd_3 on cd (cd_desc);
read c:\dosapps\music\data\cd.dat