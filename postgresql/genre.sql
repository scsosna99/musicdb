DROP TABLE genre CASCADE;

CREATE TABLE genre
(
	genre_seq_id 		INTEGER		NOT NULL,
	dscr 			VARCHAR(50)	NOT NULL,
	rating_pct 		NUMERIC(4,3)	NOT NULL,
	parent_genre_seq_id	INTEGER,
	CONSTRAINT genre_pk PRIMARY KEY (genre_seq_id)
);
ALTER TABLE genre
	ADD CONSTRAINT genre_fk_01 FOREIGN KEY
		(parent_genre_seq_id)
	REFERENCES genre
		(genre_seq_id);

\i ../genre.dat;
