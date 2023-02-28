SELECT
  items.order_id,
  items.user_id,
  orders.gender,
  items.status,
  items.product_id,
  items.delivered_at as delivered,
  products.cost,
  products.retail_price,
  items.sale_price,
  orders.num_of_item as num_item,
  ROUND(products.retail_price, 0) - ROUND(products.cost, 0) as profit,
  ((ROUND(products.retail_price, 0) - ROUND(products.cost, 0))/products.cost) as percent_profit,
FROM bigquery-public-data.thelook_ecommerce.order_items as items
INNER JOIN bigquery-public-data.thelook_ecommerce.products as products
    ON items.product_id = products.id
INNER JOIN bigquery-public-data.thelook_ecommerce.orders as orders
    ON items.order_id = orders.order_id
WHERE items.status ='Complete'
ORDER BY 1,2 ASC;