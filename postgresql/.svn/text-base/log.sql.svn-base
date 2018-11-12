CREATE TABLE play_log
(
	log_seq_id	INTEGER		NOT NULL PRIMARY KEY,
	song_seq_id	INTEGER		NOT NULL REFERENCES song(song_seq_id),
	played_on_date	TIMESTAMP	NOT NULL
);
CREATE INDEX play_log_i_01 ON play_log (song_seq_id);

CREATE TABLE play_log_hist
(
	log_seq_id	INTEGER		NOT NULL PRIMARY KEY,
	cd_seq_id	INTEGER		NOT NULL,
	song_nbr	INTEGER		NOT NULL,
	played_on_date	TIMESTAMP	NOT NULL
);
