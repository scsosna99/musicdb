prompt ...cd_label...
rem prompt Renaming table CD_LABEL...
DROP TABLE cd_label_old;
RENAME cd_label TO cd_label_old;
ALTER TABLE cd DROP CONSTRAINT cd_fk_02;
ALTER TABLE cd_label_old DROP CONSTRAINT cd_label_pk;
rem prompt Creating table CD_LABEL...
CREATE TABLE cd_label
(
	label_code VARCHAR2(3) NOT NULL,
	label_name VARCHAR2(35) NOT NULL,
	CONSTRAINT cd_label_pk PRIMARY KEY (label_code)
);
rem prompt Loading table CD_LABEL...
@label.dat

ALTER TABLE cd_label ADD label_url VARCHAR(256);
ALTER TABLE cd_label ADD comment_text VARCHAR(2000);

rem prompt Moving data from original table...
UPDATE
	cd_label
SET
	(label_url, comment_text) =
		(SELECT
			label_url,
			comment_text
		 FROM
			cd_label inner
		 WHERE
			cd_label.label_code = inner.label_code);
