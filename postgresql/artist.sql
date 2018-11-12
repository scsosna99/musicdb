DROP TABLE artist_old CASCADE;
ALTER TABLE artist RENAME TO artist_old;

CREATE TABLE artist
(
	artist_seq_id	INTEGER		NOT NULL	PRIMARY KEY,
	last_name	VARCHAR(45)	NOT NULL,
	first_name	VARCHAR(50),
	display_name	VARCHAR(128)	NOT NULL,
	UNIQUE (last_name, first_name)
);

\i ../artist.dat;

ALTER TABLE artist ADD allmusic_url VARCHAR(256);
ALTER TABLE artist ADD purchase_url VARCHAR(256);
ALTER TABLE artist ADD artist_url VARCHAR(256);
ALTER TABLE artist ADD last_played_on_date TIMESTAMP;
ALTER TABLE artist ADD rating_pct NUMERIC(4,3);

UPDATE
	artist
SET
	allmusic_url = artist_old.allmusic_url,
	purchase_url = artist_old.purchase_url,
	artist_url = artist_old.artist_url,
	last_played_on_date = artist_old.last_played_on_date,
	rating_pct = artist_old.rating_pct
FROM
	artist_old
WHERE
	artist.artist_seq_id = artist_old.artist_seq_id;

UPDATE artist SET rating_pct = .5 WHERE rating_pct IS NULL;

ALTER TABLE artist ALTER COLUMN rating_pct SET NOT NULL;

DROP TABLE artist_old CASCADE;

CREATE INDEX artist_i_01 ON artist (last_name, first_name);
CREATE INDEX artist_i_02 ON artist (display_name);
