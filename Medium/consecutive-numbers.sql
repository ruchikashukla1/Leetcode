-- Language = T-SQL

select distinct l1.num as "ConsecutiveNums"
from logs l1, logs l2, logs l3
where 
(
(l1.id - l2.id =1 AND l2.id - l3.id = 1 AND l1.id - l3.id =2 ) OR
(l2.id - l1.id =1 AND l1.id - l3.id = 1 AND l1.id - l3.id =2)  OR
(l3.id- l2.id =1 AND l2.id- l1.id = 1 AND l3.id - l1.id =2)  
) AND (l1.num = l2.num AND l2.num=l3.num AND l3.num=l1.num)