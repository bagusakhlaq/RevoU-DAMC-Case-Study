SELECT
  id as users_id,
  gender,
  created_at
FROM bigquery-public-data.thelook_ecommerce.users
ORDER BY 1;