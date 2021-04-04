CREATE TABLE request_log
(
	request_log_seq_id	INTEGER		NOT NULL PRIMARY KEY,
	song_seq_id		INTEGER		REFERENCES song(song_seq_id),
	cd_seq_id		INTEGER		REFERENCES cd(cd_seq_id),
	request_date		TIMESTAMP	NOT NULL,
	play_log_seq_id		INTEGER		REFERENCES play_log(log_seq_id),
	email_addr		VARCHAR(256)	NOT NULL,
	confirm_code		VARCHAR(20)	NOT NULL,
	confirm_date		TIMESTAMP,
	artist_seq_id		INTEGER		REFERENCES artist(artist_seq_id),
	label_code		VARCHAR(3)
);
CREATE INDEX request_log_i_01 ON request_log (song_seq_id);
CREATE INDEX request_log_i_02 ON request_log (cd_seq_id);
CREATE INDEX request_log_i_03 ON request_log (play_log_seq_id);
CREATE INDEX request_log_i_04 ON request_log (artist_seq_id);

CREATE TABLE request_log_hist
(
	request_log_seq_id	INTEGER		NOT NULL PRIMARY KEY,
	song_seq_id		INTEGER		REFERENCES song(song_seq_id),
	cd_seq_id		INTEGER		REFERENCES cd(cd_seq_id),
	request_date		TIMESTAMP	NOT NULL,
	play_log_seq_id		INTEGER		REFERENCES play_log(log_seq_id),
	email_addr		VARCHAR(256)	NOT NULL,
	confirm_code		VARCHAR(20)	NOT NULL,
	confirm_date		TIMESTAMP,
	artist_seq_id		INTEGER		REFERENCES artist(artist_seq_id),
	song_nbr		INTEGER,
	label_code		VARCHAR(3)
);
