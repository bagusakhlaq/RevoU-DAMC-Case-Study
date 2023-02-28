SELECT
  products.category,
  products.brand,
  items.delivered_at,
  SUM(ROUND(items.sale_price, 0)) as total_sales,
  SUM(ROUND(products.retail_price, 0) - ROUND(products.cost, 0)) as profit
FROM bigquery-public-data.thelook_ecommerce.order_items as items
INNER JOIN bigquery-public-data.thelook_ecommerce.products as products
ON items.product_id = products.id
WHERE items.status = 'Complete'
GROUP BY 1,2,3
ORDER BY 1;