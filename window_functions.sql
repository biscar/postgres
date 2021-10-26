/* ROW_NUMBER и ORDER BY */
select name, event, row_number() over () as row_number
from athlete_events order by row_number asc;