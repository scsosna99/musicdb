ALTER TABLE cd
	ADD CONSTRAINT cd_fk_01 FOREIGN KEY (artist_seq_id) REFERENCES artist (artist_seq_id),
	ADD CONSTRAINT cd_fk_02 FOREIGN KEY (label_code) REFERENCES cd_label (label_code),
	ADD CONSTRAINT cd_fk_03 FOREIGN KEY (genre_seq_id) REFERENCES genre (genre_seq_id);

ALTER TABLE song
	ADD CONSTRAINT song_fk_01 FOREIGN KEY (cd_seq_id) REFERENCES cd (cd_seq_id),
	ADD CONSTRAINT song_fk_02 FOREIGN KEY (artist_seq_id) REFERENCES artist (artist_seq_id);

ALTER TABLE play_log
	ADD CONSTRAINT play_log_fk_01 FOREIGN KEY (song_seq_id) REFERENCES song (song_seq_id);

ALTER TABLE request_log
	ADD CONSTRAINT request_log_fk_01 FOREIGN KEY (song_seq_id) REFERENCES song (song_seq_id),
	ADD CONSTRAINT request_log_fk_02 FOREIGN KEY (cd_seq_id) REFERENCES cd (cd_seq_id),
	ADD CONSTRAINT request_log_fk_03 FOREIGN KEY (play_log_seq_id) REFERENCES play_log (log_seq_id),
	ADD CONSTRAINT request_log_fk_04 FOREIGN KEY (artist_seq_id) REFERENCES artist (artist_seq_id);
