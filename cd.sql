PROMPT ...cd...
rem PROMPT Renaming table CD to CD_OLD...
alter table cd drop constraint cd_pk cascade;
alter table cd drop constraint cd_fk_01 cascade;
alter table cd drop constraint cd_fk_02 cascade;
rename cd to cd_old;

rem PROMPT Creating table CD...
CREATE TABLE cd
(
	cd_seq_id		NUMBER(4,0)	NOT NULL,
	name    		VARCHAR2(60)	NOT NULL,
	artist_seq_id		NUMBER(4,0)	NOT NULL,
	label_code		VARCHAR2(3)	NOT NULL,
	label_id		VARCHAR2(20)	NOT NULL,
	song_qty		NUMBER(2,0)	NOT NULL,
	total_time		VARCHAR2(5)	NOT NULL,
	code_1			VARCHAR(3),
	genre_seq_id		NUMBER(8,0)	NOT NULL,
	CONSTRAINT cd_pk PRIMARY KEY (cd_seq_id));

rem PROMPT Creating indices for table CD...
ALTER TABLE cd
  ADD CONSTRAINT cd_fk_01 FOREIGN KEY
	(artist_seq_id)
  REFERENCES artist
	(artist_seq_id)
  ADD CONSTRAINT cd_fk_02 FOREIGN KEY
	(label_code)
  REFERENCES cd_label
	(label_code)
  ADD CONSTRAINT cd_fk_03 FOREIGN KEY
	(genre_seq_id)
  REFERENCES genre
	(genre_seq_id);
rem PROMPT Loading table CD...
@crash/cd.dat
@cd.dat

rem PROMPT Adding additional columns to CD...
ALTER TABLE cd ADD allmusic_url VARCHAR(256);
ALTER TABLE cd ADD purchase_url VARCHAR(256);
ALTER TABLE cd 
	ADD genre_seq_id NUMBER(8,0)
	ADD CONSTRAINT cd_fk_03 FOREIGN KEY
		(genre_seq_id)
	REFERENCES genre
		(genre_seq_id);
ALTER TABLE cd ADD last_played_on_date DATE;
ALTER TABLE cd ADD rating_pct NUMBER(4,3);
ALTER TABLE cd ADD amazon_asin_code CHAR(10);

rem PROMPT Updating last_played_on_date in CD...
UPDATE cd SET
	(allmusic_url, purchase_url, genre_seq_id, last_played_on_date, rating_pct) =
	(SELECT
		allmusic_url, purchase_url, genre_seq_id, last_played_on_date, rating_pct 
	 FROM cd_old
	 WHERE cd_old.cd_seq_id = cd.cd_seq_id);
UPDATE cd SET rating_pct = .5 WHERE rating_pct IS NULL;

rem PROMPT Further modifying CD...
ALTER TABLE cd MODIFY rating_pct NOT NULL;

rem PROMPT Dropping CD_OLD...
DROP TABLE cd_old CASCADE CONSTRAINTS;
