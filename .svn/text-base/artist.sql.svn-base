PROMPT ...artist...

rem PROMPT Renaming table ARTIST to ARTIST_OLD...
ALTER TABLE artist DROP CONSTRAINT artist_pk CASCADE;
ALTER TABLE artist DROP CONSTRAINT artist_u_01 CASCADE;
DROP INDEX artist_i_01;
RENAME artist TO artist_old;

rem PROMPT Creating table ARTIST...
CREATE TABLE artist
(
	artist_seq_id	NUMBER(4,0)		NOT NULL,
	last_name		VARCHAR2(45)	NOT NULL,
	first_name		VARCHAR2(50),
	display_name		VARCHAR2(128)	NOT NULL,
	CONSTRAINT artist_pk PRIMARY KEY (artist_seq_id),
    CONSTRAINT artist_u_01 UNIQUE (last_name, first_name)
);

rem PROMPT Creating indices for table ARTIST...
CREATE INDEX artist_i_01 ON artist (last_name);

rem PROMPT Loading table ARTIST...
@artist.dat

rem PROMPT Adding additional column to ARTIST...
ALTER TABLE artist ADD allmusic_url VARCHAR(256);
ALTER TABLE artist ADD purchase_url VARCHAR(256);
ALTER TABLE artist ADD artist_url VARCHAR(256);
ALTER TABLE artist ADD last_played_on_date DATE;
ALTER TABLE artist ADD rating_pct NUMBER(4,3);

rem PROMPT Updating last_played_on_date from ARTIST_OLD...
UPDATE	artist
SET		
	(allmusic_url, purchase_url, artist_url, last_played_on_date, rating_pct) = 
	(SELECT 
		allmusic_url, purchase_url, artist_url, last_played_on_date, rating_pct
	 FROM artist_old WHERE artist_old.artist_seq_id = artist.artist_seq_id);
UPDATE artist SET rating_pct = .5 WHERE rating_pct IS NULL;

rem PROMPT Further modifying table
ALTER TABLE artist MODIFY rating_pct NOT NULL;

rem PROMPT Dropping ARTIST_OLD...
DROP TABLE artist_old;
