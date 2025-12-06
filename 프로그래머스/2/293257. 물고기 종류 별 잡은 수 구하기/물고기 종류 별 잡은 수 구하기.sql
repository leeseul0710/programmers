select
    count(ID) as FISH_COUNT,
    b.FISH_NAME
from FISH_INFO a
left join FISH_NAME_INFO b on a.FISH_TYPE = b.FISH_TYPE
group by 2
order by 1 desc