-- 이진수는 십진수의 나머지를 거꾸로 읽는 것
-- 비튼 이진수의 각 자리수를 의미하며, 2의 제곱으로 2의 0 제곱 1, 2의 1 제곱 2, 2의 2 제곱 4,.. 순으로 이어짐
-- 비트의 형질을 가지고 있는지는 0 또는 해당 비트 수로 나온다 
select count(*) as COUNT
from ECOLI_DATA
where GENOTYPE & 2 = 0
and (GENOTYPE & 1 <> 0 or GENOTYPE & 4 <> 0)