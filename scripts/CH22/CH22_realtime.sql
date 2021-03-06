select * from (
select a.sid session_id, a.sql_id
,a.status
,a.cpu_time/1000000 cpu_sec
,a.buffer_gets, a.disk_reads
,b.sql_text sql_text
from v$sql_monitor a
    ,v$sql b
where a.sql_id = b.sql_id
order by a.cpu_time desc)
where rownum <=20;
