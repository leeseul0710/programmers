select
    count(id) as FISH_COUNT,
    max(LENGTH) as MAX_LENGTH,
    a.FISH_TYPE
from FISH_INFO a
inner join (select
                FISH_TYPE,
                avg(coalesce(LENGTH,10))
           from FISH_INFO
           group by 1
           having avg(coalesce(LENGTH,10)) >= 33
           ) b on a.FISH_TYPE = b.FISH_TYPE
group by 3
order by 3