with pct as (
select
    id,
    percent_rank () over (order by SIZE_OF_COLONY desc) as percentile
from ECOLI_DATA)
select
    id,
    case when percentile >= 0 and percentile <= 0.25 then 'CRITICAL'
         when percentile > 0.25 and percentile <= 0.50 then 'HIGH'
         when percentile > 0.50 and percentile <= 0.75 then 'MEDIUM'
         when percentile > 0.75 and percentile <= 1 then 'LOW' end as COLONY_NAME
from pct
order by 1