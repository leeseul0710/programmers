-- 자식 & 부모 = 부모
select
    b.id,
    b.GENOTYPE,
    a.GENOTYPE as PARENT_GENOTYPE
from ECOLI_DATA a -- parent
inner join ECOLI_DATA b on a.id = b.PARENT_ID -- child
where a.GENOTYPE & b.GENOTYPE = a.GENOTYPE