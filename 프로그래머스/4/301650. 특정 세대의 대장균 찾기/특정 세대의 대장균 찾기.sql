with recursive generation as (
select
    id,
    1 as generation
from ECOLI_DATA
where parent_id is null

union all
    
select
    a.id,
    generation + 1 as generation
from ECOLI_DATA a
inner join generation b on a.parent_id = b.id
)
select
    id
from generation
where generation = 3
order by 1