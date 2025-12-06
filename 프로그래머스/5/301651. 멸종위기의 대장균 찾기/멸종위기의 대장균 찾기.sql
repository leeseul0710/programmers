-- 세대 별 자식이 없는 개체의 수 (세대에 대해 오름차순)
-- 1. 세대 구하기 (parent id 가 Null 이면 1세대, 1세대가 부모면 2세대,.. 계속 이어나가야 함) = recursive CTE 로 끝날 때까지 돌려야 함 
-- 2. 자식이 없는 개체 구하기 (Parent id 에 등장하지 않는)

with recursive generation as (
select id, 1 as generation
from ECOLI_DATA
where parent_id is null

union all

select a.id, b.generation + 1
from ECOLI_DATA a
inner join generation b on a.parent_id = b.id    
)

select
    count(*) as count,
    generation
from generation
where id not in (select distinct parent_id from ECOLI_DATA where parent_id is not null)
group by 2
order by 2