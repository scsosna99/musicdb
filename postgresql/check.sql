select	song.cd_seq_id,
		count(song.cd_seq_id)
  from  song
 group by song.cd_seq_id
having count(song.cd_seq_id) <>
	(select cd.song_qty
	   from	cd
      where song.cd_seq_id = cd.cd_seq_id);
