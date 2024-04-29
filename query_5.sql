-- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, product_code, product, manufacturing_cost

select dp.product_code, dp.product, fc.manufacturing_cost from dim_product dp
join fact_manufacturing_cost fc on dp.product_code = fc.product_code 
where manufacturing_cost in (
			( select min(manufacturing_cost) from fact_manufacturing_cost),
            (select max(manufacturing_cost) from fact_manufacturing_cost)
            );
		