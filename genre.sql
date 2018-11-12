rem prompt ...genre...
rem prompt Dropping table GENRE...
DROP TABLE genre CASCADE CONSTRAINTS;
rem prompt Creating table GENRE...
CREATE TABLE genre
(
	genre_seq_id NUMBER(8,0) NOT NULL,
	dscr VARCHAR2(50) NOT NULL,
	rating_pct NUMBER(4,3) NOT NULL,
	parent_genre_seq_id NUMBER(8,0),
	CONSTRAINT genre_pk PRIMARY KEY (genre_seq_id)
);
ALTER TABLE genre
	ADD CONSTRAINT genre_fk_01 FOREIGN KEY
		(parent_genre_seq_id)
	REFERENCES genre
		(genre_seq_id);
rem prompt Loading table GENRE...
@genre.dat
