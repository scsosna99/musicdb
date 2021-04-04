CREATE OR REPLACE VIEW v_play_log_info AS
SELECT
	pl.log_seq_id,
	pl.played_on_date,
	cd.cd_seq_id,
	cd.name AS cd_name,
	cd.allmusic_url AS cd_allmusic_url,
	cd.purchase_url AS cd_purchase_url,
	cd.amazon_asin_code AS amazon_asin_code,
	a.artist_seq_id,
	a.last_name,
	a.first_name,
	a.display_name AS artist_display_name,
	a.purchase_url AS artist_allmusic_url,
	a.purchase_url AS artist_purchase_url,
	s.song_seq_id,
	REPLACE(s.name,'<','&lt;') AS song_name,
	s.allmusic_url AS song_allmusic_url,
	l.label_code,
	l.label_name,
	REPLACE(cd.label_id,'<','&lt;') AS label_id,
	l.label_url
FROM
	play_log pl,
	song s,
	cd,
	artist a,
	cd_label l
WHERE
	pl.song_seq_id = s.song_seq_id AND
	s.cd_seq_id = cd.cd_seq_id AND
	COALESCE(s.artist_seq_id, cd.artist_seq_id) = a.artist_seq_id AND
	cd.label_code = l.label_code
ORDER BY pl.played_on_date DESC;

CREATE OR REPLACE VIEW v_cd_info AS
SELECT
	cd.cd_seq_id,
	cd.name,
	cd.total_time,
	cd.allmusic_url,
	cd.purchase_url,
	cd.amazon_asin_code,
	cd.last_played_on_date,
	cd.artist_seq_id,
	a.last_name AS artist_last_name,
	a.first_name AS artist_first_name,
	a.display_name AS artist_display_name,
	l.label_code,
	l.label_name,
	REPLACE(cd.label_id,'<','&lt;') AS label_id,
	l.label_url
FROM
	cd	JOIN artist a USING (artist_seq_id)
		JOIN cd_label l ON (cd.label_code = l.label_code)
ORDER BY
	cd.name;

CREATE OR REPLACE VIEW v_cd_song_info AS
SELECT
	cd.cd_seq_id,
	cd.name AS cd_name,
	cd.last_played_on_date AS cd_last_played_on_date,
	cd.amazon_asin_code AS amazon_asin_code,
	a.artist_seq_id,
	a.last_name,
	a.first_name,
	a.display_name AS artist_display_name,
	a.artist_url,
	a.last_played_on_date AS artist_last_played_on_date,
	s.song_seq_id,
	s.song_nbr,
	REPLACE(s.name,'<','&lt;') AS song_name,
	s.song_time,
	s.allmusic_url AS song_allmusic_url,
	s.last_played_on_date AS song_last_played_on_date,
	l.label_code,
	l.label_name,
	REPLACE(cd.label_id,'<','&lt;') AS label_id,
	l.label_url
FROM
	cd,
	song s,
	artist a,
	cd_label l
WHERE
	cd.cd_seq_id = s.cd_seq_id AND
	COALESCE(s.artist_seq_id, cd.artist_seq_id) = a.artist_seq_id AND
	cd.label_code = l.label_code
ORDER BY
	cd.cd_seq_id,
	s.song_nbr;


CREATE OR REPLACE VIEW v_song_info AS
SELECT
	cd.cd_seq_id,
	cd.name AS cd_name,
	cd.amazon_asin_code AS amazon_asin_code,
	a.artist_seq_id,
	a.last_name AS artist_last_name,
	a.first_name AS artist_first_name,
	a.display_name AS artist_display_name,
	s.song_seq_id,
	s.song_nbr,
	REPLACE(s.name,'<','&lt;') AS song_name,
	s.song_time,
	s.allmusic_url AS allmusic_url,
	s.last_played_on_date AS last_played_on_date
FROM
	cd	JOIN song s ON cd.cd_seq_id = s.cd_seq_id
		JOIN cd_label l ON cd.label_code = l.label_code,
	artist a
WHERE
	COALESCE(s.artist_seq_id, cd.artist_seq_id) = a.artist_seq_id
ORDER BY
	cd.cd_seq_id,
	s.song_nbr;
