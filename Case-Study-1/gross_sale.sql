SELECT
  items.order_id,
  items.user_id,
  items.delivered_at as delivered,
  orders.gender,
  SUM(orders.num_of_item * items.sale_price) as order_revenue
FROM bigquery-public-data.thelook_ecommerce.orders as orders
INNER JOIN bigquery-public-data.thelook_ecommerce.order_items as items
ON items.order_id = orders.order_id
WHERE items.status = 'Complete'
GROUP BY 1,2,3,4