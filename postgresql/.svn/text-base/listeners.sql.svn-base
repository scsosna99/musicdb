CREATE TABLE listener_track
(
	listener_address_id	VARCHAR(256)	NOT NULL	PRIMARY KEY,
	ip_address		VARCHAR(64)	NOT NULL,
	longitude_nbr		FLOAT,
	latitude_nbr		FLOAT,
	city_name		VARCHAR(40),
	country_code		VARCHAR(2),
	country_name		VARCHAR(40),
	location_name		VARCHAR(256),
	current_flag		BOOLEAN		NOT NULL	DEFAULT('N'),
	last_track_date		TIMESTAMP	NOT NULL	DEFAULT (CURRENT_TIMESTAMP),
	total_track_cnt		INTEGER		NOT NULL	DEFAULT (1)
);


CREATE OR REPLACE VIEW v_listener_track_sorted AS
	SELECT
		listener_address_id,
		ip_address,
		longitude_nbr,
		latitude_nbr,
		city_name,
		country_code,
		country_name,
		location_name,
		current_flag,
		last_track_date,
		total_track_cnt
	FROM
		listener_track
	WHERE
		longitude_nbr IS NOT NULL AND
		latitude_nbr IS NOT NULL
	ORDER BY
		last_track_date DESC;
