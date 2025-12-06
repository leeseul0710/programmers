with base as (
select
   PARENT_ID as ID,
   count(ID) as CHILD_COUNT
from ECOLI_DATA
where PARENT_ID is not null
group by 1
)
select
    a.ID,
    coalesce(CHILD_COUNT,0) as CHILD_COUNT
from ECOLI_DATA a
left join base b on a.ID = b.ID