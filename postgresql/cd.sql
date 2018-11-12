DROP TABLE cd_old CASCADE;
ALTER TABLE cd RENAME TO cd_old;

CREATE TABLE cd
(
	cd_seq_id	INTEGER		NOT NULL PRIMARY KEY,
	name    	VARCHAR(60)	NOT NULL,
	artist_seq_id	INTEGER		NOT NULL REFERENCES artist(artist_seq_id),
	label_code	VARCHAR(3)	NOT NULL REFERENCES cd_label(label_code),
	label_id	VARCHAR(20)	NOT NULL,
	song_qty	INTEGER		NOT NULL,
	total_time	VARCHAR(5)	NOT NULL,
	code_1		VARCHAR(3),
	genre_seq_id	INTEGER		NOT NULL REFERENCES genre(genre_seq_id)
);
\i ../crash/cd.dat;
\i ../cd.dat;

ALTER TABLE cd ADD allmusic_url VARCHAR(256);
ALTER TABLE cd ADD purchase_url VARCHAR(256);
ALTER TABLE cd ADD last_played_on_date TIMESTAMP;
ALTER TABLE cd ADD rating_pct NUMERIC(4,3);
ALTER TABLE cd ADD amazon_asin_code VARCHAR(10);

UPDATE
	cd
SET
	allmusic_url = cd_old.allmusic_url,
	purchase_url = cd_old.purchase_url,
	genre_seq_id = cd_old.genre_seq_id,
	last_played_on_date = cd_old.last_played_on_date,
	rating_pct = cd_old.rating_pct,
	amazon_asin_code = cd_old.amazon_asin_code
FROM
	cd_old
WHERE
	cd.cd_seq_id = cd_old.cd_seq_id;

UPDATE cd SET rating_pct = .5 WHERE rating_pct IS NULL;

ALTER TABLE cd ALTER COLUMN rating_pct SET NOT NULL;

DROP TABLE cd_old CASCADE;

CREATE INDEX cd_i_01 ON cd (name);
CREATE INDEX cd_i_02 ON cd (artist_seq_id);
CREATE INDEX cd_i_03 ON cd (label_code);
CREATE INDEX cd_i_04 ON cd (genre_seq_id);
