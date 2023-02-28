SELECT
  orders.order_id,
  orders.delivered_at
FROM  bigquery-public-data.thelook_ecommerce.orders as orders
WHERE orders.status = 'Complete';