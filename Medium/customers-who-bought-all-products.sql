--Compare the "List of products for each customer from customer table" with "List of All products from product table"

with distinct_pairs as (

    select distinct customer_id, product_key
    from customer 
)
select customer_id
from distinct_pairs 
group by customer_id 
having string_agg(product_key::varchar, ',' order by product_key) = ( select string_agg(product_key::varchar, ',' order by product_key) from Product)

