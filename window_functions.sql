/* ROW_NUMBER и ORDER BY */
select name, event, row_number() over () as row_number
from athlete_events order by row_number asc;

select sport, row_number() over (order by sport asc ) as row_n
from ( select distinct sport from athlete_events) as sports order by sport asc;

/* Lag, PARTITION BY */
with tennis_gold as (
    select name, sex, year, noc
    from athlete_events
    where year >= 2004
      and sport = 'Tennis'
      and event like '%Singles%'
      and medal = 'Gold'
)

select name as champion, sex, year, lead(name) over (partition by sex order by year asc) as future_champion
from tennis_gold
order by sex asc, year asc;

select name as champion, sex, year, lag(name) over (partition by sex order by year asc) as last_champion
from tennis_gold
order by sex asc, year asc;

/* LEAD */

with tennis_goldf as (
    select name, sex, year, noc
    from athlete_events
    where year >= 2004
      and sport = 'Tennis'
      and event like '%Singles%'
      and medal = 'Gold'
)

select name as champion, sex, year, lead(name) over (partition by sex order by year asc) as future_champion
from tennis_goldf
order by sex asc, year asc;

/* RANK DENSE*/

with countries as (
    select noc, count(distinct year) as participated
    from athlete_events where noc in ('GBR', 'DEN', 'FRA', 'ITA','BLR')
    group by noc
)
select noc, participated,
       row_number() over (order by participated desc),
       rank() over (order by participated desc),
       dense_rank() over  (order by participated desc)
from countries order by participated desc;