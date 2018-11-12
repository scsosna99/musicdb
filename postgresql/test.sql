SELECT
	cd.cd_seq_id,
	cd.name AS cd_name,
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
	COALESCE(s.artist_seq_id, cd.artist_seq_id) = a.artist_seq_id AND
	s.name like '%Sex%'
ORDER BY
	cd.cd_seq_id,
	s.song_nbr;
