PROMPT ...request_log...
CREATE TABLE request_log
(
	request_log_seq_id	NUMBER(8)	NOT NULL PRIMARY KEY,
	song_seq_id		NUMBER(5,0),
	cd_seq_id		NUMBER(4,0),
	request_date		DATE		NOT NULL,
	play_log_seq_id		NUMBER(7),
	email_addr		VARCHAR2(256)	NOT NULL,
	confirm_code		VARCHAR2(20)	NOT NULL,
	confirm_date		DATE,
	artist_seq_id		NUMBER(4),
	label_code		VARCHAR2(3)
);
ALTER TABLE request_log
	ADD CONSTRAINT request_log_fk_01 FOREIGN KEY
		(song_seq_id)
	REFERENCES song
		(song_seq_id);
ALTER TABLE request_log
	ADD CONSTRAINT request_log_fk_02 FOREIGN KEY
		(cd_seq_id)
	REFERENCES cd
		(cd_seq_id);
ALTER TABLE request_log
	ADD CONSTRAINT request_log_fk_03 FOREIGN KEY
		(play_log_seq_id)
	REFERENCES play_log
		(log_seq_id);
ALTER TABLE request_log
      ADD CONSTRAINT request_log_fk_04 FOREIGN KEY
	  (artist_seq_id)
	REFERENCES artist
	  (artist_seq_id);
ALTER TABLE request_log
      ADD CONSTRAINT request_log_fk_05 FOREIGN KEY
	  (label_code)
	REFERENCES cd_label
	  (label_code);
