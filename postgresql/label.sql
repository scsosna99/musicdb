DROP TABLE cd_label_old CASCADE;
ALTER TABLE cd_label RENAME TO cd_label_old;

CREATE TABLE cd_label
(
	label_code VARCHAR(3)		NOT NULL	PRIMARY KEY,
	label_name VARCHAR(35)		NOT NULL
);


\i ../label.dat;

ALTER TABLE cd_label ADD label_url VARCHAR(256);
ALTER TABLE cd_label ADD comment_text TEXT;

UPDATE
	cd_label
SET
	label_url = cd_label_old.label_url,
	comment_text = cd_label_old.comment_text
FROM
	cd_label_old
WHERE
	cd_label.label_code = cd_label_old.label_code;

DROP TABLE cd_label_old CASCADE;
