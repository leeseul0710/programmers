select
    count(ID) as FISH_COUNT,
    month(TIME) as MONTH
from FISH_INFO
group by 2
having count(ID) >= 1
order by 2