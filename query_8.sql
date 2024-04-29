-- In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the total_sold_quantity, Quarter total_sold_quantity

select
CASE
    WHEN date between '2019-09-01' and '2019-11-30' THEN 'Q1'
    WHEN date between '2019-12-01' and '2020-02-29' THEN 'Q2'
    WHEN date between '2020-03-01' and '2020-05-31' THEN 'Q3'
    WHEN date between '2020-06-01' and '2020-08-31' THEN 'Q4'
END AS quarters,
sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year = 2020
group by quarters
order by total_sold_quantity desc;


