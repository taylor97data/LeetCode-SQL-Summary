# Write your MySQL query statement below
select b.stock_name,sum(s.price_sum)-sum(b.price_sum) as capital_gain_loss
from
(select stock_name,sum(price)price_sum from stocks s1 where operation='Buy' group by stock_name)b,
(select stock_name,sum(price)price_sum from stocks s2 where operation='Sell' group by stock_name)s
where b.stock_name = s.stock_name
group by b.stock_name;
