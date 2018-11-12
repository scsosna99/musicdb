DROP TABLE song_old CASCADE;
ALTER TABLE song RENAME TO song_old;

CREATE TABLE song
(
	cd_seq_id		INTEGER		NOT NULL REFERENCES cd(cd_seq_id),
	song_nbr		INTEGER		NOT NULL,
	name			VARCHAR(90)	NOT NULL,
	song_time		VARCHAR(5)	NOT NULL,
	artist_seq_id		INTEGER		REFERENCES artist(artist_seq_id),
	UNIQUE (cd_seq_id, song_nbr)
);

\i ../crash/a.dat;
\i ../a.dat;
\i ../crash/b.dat;
\i ../b.dat;
\i ../crash/c.dat;
\i ../c.dat;
\i ../crash/d.dat;
\i ../d.dat;
\i ../crash/e.dat;
\i ../e.dat;
\i ../crash/f.dat;
\i ../f.dat;
\i ../crash/g.dat;
\i ../g.dat;
\i ../crash/h.dat;
\i ../h.dat;
\i ../crash/i.dat;
\i ../i.dat;
\i ../crash/j.dat;
\i ../j.dat;
\i ../crash/k.dat;
\i ../k.dat;
\i ../crash/l.dat;
\i ../l.dat;
\i ../crash/m.dat;
\i ../m.dat;
\i ../crash/n.dat;
\i ../n.dat;
\i ../crash/o.dat;
\i ../o.dat;
\i ../crash/p.dat;
\i ../p.dat;
\i ../q.dat;
\i ../crash/r.dat;
\i ../r.dat;
\i ../crash/s.dat;
\i ../s.dat;
\i ../crash/t.dat;
\i ../t.dat;
\i ../u.dat;
\i ../crash/v.dat;
\i ../v1.dat;
\i ../v.dat;
\i ../crash/w.dat;
\i ../w.dat;
\i ../x.dat;
\i ../crash/y.dat;
\i ../y.dat;
\i ../crash/z.dat;
\i ../z.dat;

ALTER TABLE song ADD allmusic_url VARCHAR(256);
ALTER TABLE song ADD last_played_on_date TIMESTAMP;
ALTER TABLE song ADD rating_pct NUMERIC(4,3);
ALTER TABLE song ADD song_seq_id INTEGER;

UPDATE song
SET
	allmusic_url = song_old.allmusic_url,
	last_played_on_date = song_old.last_played_on_date,
	rating_pct = song_old.rating_pct,
	song_seq_id = song_old.song_seq_id
FROM
	song_old
WHERE
	song.cd_seq_id = song_old.cd_seq_id AND
	song.song_nbr = song_old.song_nbr;

UPDATE song SET rating_pct = .5 WHERE rating_pct IS NULL;
UPDATE song SET song_seq_id = nextval('song_s_01') WHERE song_seq_id IS NULL;

ALTER TABLE song ALTER COLUMN song_seq_id SET NOT NULL;
ALTER TABLE song ADD PRIMARY KEY (song_seq_id);
ALTER TABLE song ALTER COLUMN rating_pct SET NOT NULL;

DROP TABLE song_old CASCADE;

CREATE INDEX song_i_01 ON song (name);
CREATE INDEX song_i_02 ON song (cd_seq_id);
CREATE INDEX song_i_03 ON song (artist_seq_id);
