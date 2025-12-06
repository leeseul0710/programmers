with max_size as (
select
    year(DIFFERENTIATION_DATE) as YEAR,
    max(SIZE_OF_COLONY) as max_size
from ECOLI_DATA
group by 1)
select
    b.YEAR,
    max_size - SIZE_OF_COLONY as YEAR_DEV,
    a.id as ID
from ECOLI_DATA a
left join max_size b on year(a.DIFFERENTIATION_DATE) = b.YEAR
order by 1,2