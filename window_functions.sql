/* ROW_NUMBER и ORDER BY */
select name, event, row_number() over () as row_number
from athlete_events order by row_number asc;

select sport, row_number() over (order by sport asc ) as row_n
from ( select distinct sport from athlete_events) as sports order by sport asc;


