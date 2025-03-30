WITH aug_16_prices AS (

    SELECT product_id, max(change_date) FILTER (WHERE change_date <= '2019-08-16') AS tmp_date
    FROM products
    GROUP BY product_id
)

SELECT ap.product_id, 
CASE WHEN pr.new_price IS NULL
     THEN 10 else pr.new_price END AS price

FROM products pr RIGHT JOIN aug_16_prices ap 
                         ON (pr.change_date, pr.product_id) = (ap.tmp_date, ap.product_id)