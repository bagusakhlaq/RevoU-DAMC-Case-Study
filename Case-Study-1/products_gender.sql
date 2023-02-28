SELECT
  orders.order_id,
  products.category,
  products.brand,
  products.name,
  items.delivered_at,
  orders.gender,
  SUM(ROUND(items.sale_price, 0)) as total_sales,
  SUM(ROUND(products.retail_price, 0) - ROUND(products.cost, 0)) as profit
FROM bigquery-public-data.thelook_ecommerce.order_items as items
INNER JOIN bigquery-public-data.thelook_ecommerce.products as products
    ON items.product_id = products.id
INNER JOIN bigquery-public-data.thelook_ecommerce.orders as orders
    ON items.order_id = orders.order_id
WHERE items.status = 'Complete'
GROUP BY 1,2,3,4,5,6
ORDER BY 2;