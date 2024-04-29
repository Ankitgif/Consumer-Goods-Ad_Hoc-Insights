-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month .
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
-- The final report contains these columns: Month, Year, Gross sales Amount

select concat(monthname(sm.date), '(', YEAR(sm.date), ')') as Month, sm.fiscal_year, round(sum(gross_price*sold_quantity),2) as Gross_sales_Amount
from fact_sales_monthly sm 
join fact_gross_price gp on sm.product_code = gp.product_code
join dim_customer dc on sm.customer_code = dc.customer_code
where customer = 'Atliq Exclusive'
group by Month, fiscal_year
order by fiscal_year desc;