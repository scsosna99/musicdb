create table cd_label (
	label_cd char(3)     PRIMARY KEY,
	label_nm varchar(35) not null);
create unique index index_0 on cd_label (label_cd);
read c:\dosapps\music\data\label.dat