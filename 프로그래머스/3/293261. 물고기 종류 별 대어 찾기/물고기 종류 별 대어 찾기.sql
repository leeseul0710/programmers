select
    ID,
    FISH_NAME,
    LENGTH
from (
select
    a.FISH_TYPE,
    a.ID,
    b.FISH_NAME,
    a.LENGTH,
    rank() over (partition by a.FISH_TYPE order by a.LENGTH desc) as rn
from FISH_INFO a
left join FISH_NAME_INFO b on a.FISH_TYPE = b.FISH_TYPE
where LENGTH is not null) t
where t.rn = 1
order by 1