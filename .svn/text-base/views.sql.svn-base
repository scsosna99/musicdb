CREATE OR REPLACE VIEW cd_by_name_view AS
SELECT
	cd.cd_seq_id,
	cd.name cd_name,
	artist.artist_seq_id,
	artist.display_name artist_name,
	artist.last_name artist_last_name,
	artist.first_name artist_first_name,
	cd_label.label_code label_code,
	cd_label.label_name label_name,
	cd.song_qty,
	cd.total_time
FROM
	cd,
	artist,
	cd_label
WHERE
	cd.artist_seq_id = artist.artist_seq_id AND
	cd.label_code = cd_label.label_code
ORDER BY 2, 4, 5
/
CREATE OR REPLACE VIEW cd_by_artist_view AS
SELECT
	cd.cd_seq_id,
	cd.name cd_name,
	artist.artist_seq_id,
	artist.display_name artist_name,
	artist.last_name artist_last_name,
	artist.first_name artist_first_name,
	cd_label.label_code label_code,
	cd_label.label_name label_name,
	cd.song_qty,
	cd.total_time
FROM
	cd,
	artist,
	cd_label
WHERE
	cd.artist_seq_id = artist.artist_seq_id AND
	cd.label_code = cd_label.label_code
ORDER BY 4, 5, 2
/
CREATE OR REPLACE VIEW song_by_artist_view AS
SELECT
	song.song_seq_id,
	cd.cd_seq_id,
	song.song_nbr,
	NVL (song.artist_seq_id, cd.artist_seq_id) artist_seq_id,
	DECODE (song.artist_seq_id, NULL,
		artist1.display_name,
		artist2.display_name) artist_name,
	cd.name cd_name,
	song.name song_name,
	song.song_time,
	cd.last_played_on_date cd_last_played_on_date,
	song.last_played_on_date song_last_played_on_date,
	DECODE (song.artist_seq_id, NULL, artist1.last_played_on_date, artist2.last_played_on_date) artist_last_played_on_date
FROM
	song,
	cd,
	artist artist1,
	artist artist2
WHERE
	song.cd_seq_id = cd.cd_seq_id AND
	song.artist_seq_id = artist2.artist_seq_id (+) AND
	artist1.artist_seq_id = cd.artist_seq_id
ORDER BY
	artist_name,
	song_name,
	cd_name
/
CREATE OR REPLACE VIEW song_by_name_view AS
SELECT
	song.song_seq_id,
	cd.cd_seq_id,
	song.song_nbr,
	NVL (song.artist_seq_id, cd.artist_seq_id) artist_seq_id,
	DECODE (song.artist_seq_id, NULL,
		artist1.display_name,
		artist2.display_name) artist_name,
	cd.name cd_name,
	song.name song_name,
	song.song_time,
	cd.last_played_on_date cd_last_played_on_date,
	song.last_played_on_date song_last_played_on_date,
	DECODE (song.artist_seq_id, NULL, artist1.last_played_on_date, artist2.last_played_on_date) artist_last_played_on_date
FROM
	song,
	cd,
	artist artist1,
	artist artist2
WHERE
	song.cd_seq_id = cd.cd_seq_id AND
	song.artist_seq_id = artist2.artist_seq_id (+) AND
	artist1.artist_seq_id = cd.artist_seq_id
ORDER BY
	song_name,
	artist_name,
	cd_name
/
CREATE OR REPLACE VIEW song_by_cd_view AS
SELECT
	song.song_seq_id,
	cd.cd_seq_id,
	song.song_nbr,
	NVL(song.artist_seq_id, cd.artist_seq_id) artist_seq_id,
	DECODE (song.artist_seq_id, NULL,
		artist1.display_name,
		artist2.display_name) artist_name,
	cd.name cd_name,
	song.name song_name,
	song.song_time,
	cd.last_played_on_date cd_last_played_on_date,
	song.last_played_on_date song_last_played_on_date,
	DECODE (song.artist_seq_id, NULL, artist1.last_played_on_date, artist2.last_played_on_date) artist_last_played_on_date
FROM
	song,
	cd,
	artist artist1,
	artist artist2
WHERE
	song.cd_seq_id = cd.cd_seq_id AND
	song.artist_seq_id = artist2.artist_seq_id (+) AND
	artist1.artist_seq_id = cd.artist_seq_id
ORDER BY
	cd.cd_seq_id,
	song.song_nbr
/
CREATE OR REPLACE VIEW max_value_view AS
SELECT
	MAX (cd_seq_id) max_cd_seq_id,
	MAX (song_seq_id) max_song_seq_id
FROM
	song
/
CREATE OR REPLACE VIEW artist_by_name_view AS
SELECT
	artist.artist_seq_id,
	artist.display_name full_name
FROM
	artist
ORDER BY 2;
