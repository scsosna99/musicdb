set echo off
set feedback off

prompt Saving play_log and request_log history...
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
	FROM
		request_log r,
		song s
	WHERE
		r.song_seq_id = s.song_seq_id (+);
DELETE FROM request_log;
DELETE FROM play_log_hist;
INSERT INTO play_log_hist
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
DELETE FROM play_log;
COMMIT;

rem PROMPT Creating sequence...
DROP SEQUENCE song_s_01;
CREATE SEQUENCE song_s_01 START WITH 1 INCREMENT BY 1;

@genre.sql;
@label.sql;
@artist.sql;
@cd.sql;
@song.sql;
@log.sql;
rem @request.sql;
@sequence.sql;
rem @views.sql;


prompt Reloading play_log and request_log history...
INSERT INTO play_log
	SELECT
		pl.log_seq_id,
		s.song_seq_id,
		pl.played_on_date
	FROM
		play_log_hist pl,
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
		NULL,
		r.label_code
	FROM
		request_log_hist r,
		song s
	WHERE
		r.cd_seq_id = s.cd_seq_id (+) AND
		r.song_nbr = s.song_nbr (+);
COMMIT;


prompt Analyzing tables...
ANALYZE TABLE artist COMPUTE STATISTICS;
ANALYZE TABLE cd_label COMPUTE STATISTICS;
ANALYZE TABLE cd COMPUTE STATISTICS;
ANALYZE TABLE song COMPUTE STATISTICS;
