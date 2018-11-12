PROMPT ...play_log...
CREATE TABLE play_log
(
	log_seq_id	NUMBER(7)	NOT NULL PRIMARY KEY,
	song_seq_id	NUMBER(5)	NOT NULL,
	played_on_date	DATE	NOT NULL
);
ALTER TABLE play_log
	ADD CONSTRAINT play_log_fk_01 FOREIGN KEY
		(song_seq_id)
	REFERENCES song
		(song_seq_id)


CREATE TABLE play_log_hist
(
	log_seq_id	NUMBER(7)	NOT NULL PRIMARY KEY,
	cd_seq_id	NUMBER(8)	NOT NULL,
	song_nbr	NUMBER(7)	NOT NULL,
	played_on_date	DATE		NOT NULL
);
