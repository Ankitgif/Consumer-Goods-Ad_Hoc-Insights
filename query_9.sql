-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?
-- The final output contains these fields, channel, gross_sales_mln, percentage

with cte1 as (
select round(sum(sm.sold_quantity*gp.gross_price/1000000),2) as gross_sales_mln, channel from dim_customer dc
join fact_sales_monthly sm on dc.customer_code = sm.customer_code
join fact_gross_price gp on sm.product_code = gp.product_code
where sm.fiscal_year = 2021
group by channel)
select channel, gross_sales_mln, concat(round((gross_sales_mln*100)/sum(gross_sales_mln) over(),2), '%') as percentage
from cte1
order by percentage desc;

