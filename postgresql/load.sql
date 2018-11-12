DELETE FROM play_log_backup;
INSERT INTO play_log_backup
	SELECT
		pl.log_seq_id,
		s.cd_seq_id,
		s.song_nbr,
		played_on_date
	FROM
		play_log pl,
		song s
	WHERE
		pl.song_seq_id = s.song_seq_id;
DROP TABLE play_log CASCADE;
DELETE FROM request_log_hist;
INSERT INTO request_log_hist
       SELECT
		r.request_log_seq_id,
		r.song_seq_id,
		r.cd_seq_id,
		r.request_date,
		r.play_log_seq_id,
		r.email_addr,
		r.confirm_code,
		r.confirm_date,
		r.artist_seq_id,
		s.song_nbr,
		r.label_code
	FROM	request_log r LEFT JOIN song s USING (song_seq_id);
DROP TABLE request_log CASCADE;

\i sequence.sql;
\i genre.sql;
\i label.sql;
\i artist.sql;
\i cd.sql;
\i song.sql;
\i log.sql;
\i request.sql;
\i fkadd.sql;
\i views.sql;

INSERT INTO play_log
	SELECT
		pl.log_seq_id,
		s.song_seq_id,
		pl.played_on_date
	FROM
		play_log_backup pl,
		song s
	WHERE
		pl.cd_seq_id = s.cd_seq_id AND
		pl.song_nbr = s.song_nbr;
INSERT INTO request_log
       SELECT
		r.request_log_seq_id,
		s.song_seq_id,
		r.cd_seq_id,
		r.request_date,
		r.play_log_seq_id,
		r.email_addr,
		r.confirm_code,
		r.confirm_date,
		r.artist_seq_id,
		r.label_code
	FROM
		request_log_hist r LEFT JOIN song s USING (cd_seq_id, song_nbr);
