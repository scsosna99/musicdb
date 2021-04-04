PROMPT ...song...
rem PROMPT Renaming table SONG to SONG_OLD...
ALTER TABLE song DROP CONSTRAINT song_pk CASCADE;
ALTER TABLE song DROP CONSTRAINT song_fk_01 CASCADE;
ALTER TABLE song DROP CONSTRAINT song_fk_02 CASCADE;
ALTER TABLE song DROP CONSTRAINT song_u_01 CASCADE;
DROP INDEX song_i_01;
DROP INDEX song_i_02;
RENAME song TO song_old;

rem PROMPT Creating table SONG...
CREATE TABLE song
(
	cd_seq_id		NUMBER(4,0)		NOT NULL,
	song_nbr		NUMBER(2,0)		NOT NULL,
	name			VARCHAR2(90)	NOT NULL,
	song_time		VARCHAR2(5)		NOT NULL,
	artist_seq_id	NUMBER(4,0),
	CONSTRAINT song_u_01 UNIQUE (cd_seq_id, song_nbr)
);
ALTER TABLE song
  ADD CONSTRAINT song_fk_01 FOREIGN KEY
	(cd_seq_id)
  REFERENCES cd
	(cd_seq_id)
  ADD CONSTRAINT song_fk_02 FOREIGN KEY
	(artist_seq_id)
  REFERENCES artist
	(artist_seq_id);

rem PROMPT Creating indices for table SONG...
CREATE INDEX song_i_01 ON song (name);
CREATE INDEX song_i_02 ON song (song_time);
rem prompt Loading songs for letter A...
@crash/a.dat
@a.dat
rem prompt Loading songs for letter B...
@crash/b.dat
@b.dat
rem prompt Loading songs for letter C...
@crash/c.dat
@c.dat
rem prompt Loading songs for letter D...
@crash/d.dat
@d.dat
rem prompt Loading songs for letter E...
@crash/e.dat
@e.dat
rem prompt Loading songs for letter F...
@crash/f.dat
@f.dat
rem prompt Loading songs for letter G...
@crash/g.dat
@g.dat
rem prompt Loading songs for letter H...
@crash/h.dat
@h.dat
rem prompt Loading songs for letter I...
@crash/i.dat
@i.dat
rem prompt Loading songs for letter J...
@crash/j.dat
@j.dat
rem prompt Loading songs for letter K...
@crash/k.dat
@k.dat
rem prompt Loading songs for letter L...
@crash/l.dat
@l.dat
rem prompt Loading songs for letter M...
@crash/m.dat
@m.dat
rem prompt Loading songs for letter N...
@crash/n.dat
@n.dat
rem prompt Loading songs for letter O...
@crash/o.dat
@o.dat
rem prompt Loading songs for letter P...
@crash/p.dat
@p.dat
rem prompt Loading songs for letter Q...
@q.dat
rem prompt Loading songs for letter R...
@crash/r.dat
@r.dat
rem prompt Loading songs for letter S...
@crash/s.dat
@s.dat
rem prompt Loading songs for letter T...
@crash/t.dat
@t.dat
rem prompt Loading songs for letter U...
@u.dat
rem prompt Loading songs for letter V...
@crash/v.dat
@v1.dat
@v.dat
rem prompt Loading songs for letter W...
@crash/w.dat
@w.dat
rem prompt Loading songs for letter X...
@x.dat
rem prompt Loading songs for letter Y...
@crash/y.dat
@y.dat
rem prompt Loading songs for letter Z...
@crash/z.dat
@z.dat

rem PROMPT Adding additional columns to SONG...
ALTER TABLE song ADD allmusic_url VARCHAR(256);
ALTER TABLE song ADD last_played_on_date DATE;
ALTER TABLE song ADD rating_pct NUMBER(4,3);
ALTER TABLE song ADD song_seq_id NUMBER(5,0);

rem PROMPT Updating SONG table....
set termout off
REM SELECT song_s_01.nextval from song where song_seq_id IS NOT NULL;
set termout on
UPDATE song SET
	(allmusic_url, last_played_on_date, rating_pct) =
	(SELECT 
		allmusic_url, last_played_on_date, rating_pct
		FROM song_old 
		WHERE song_old.cd_seq_id = song.cd_seq_id
		AND   song_old.song_nbr = song.song_nbr);
UPDATE song SET rating_pct = .5 WHERE rating_pct IS NULL;
UPDATE song SET song_seq_id = song_s_01.nextval WHERE song_seq_id IS NULL;

rem PROMPT Further modifying the SONG table...
ALTER TABLE song MODIFY song_seq_id NOT NULL;
ALTER TABLE song MODIFY rating_pct NOT NULL;
ALTER TABLE song ADD CONSTRAINT song_pk PRIMARY KEY (song_seq_id);

rem PROMPT Dropping SONG_OLD...
DROP TABLE song_old;
