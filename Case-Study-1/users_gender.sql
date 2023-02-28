SELECT DISTINCT
  users.id,
  users.age,
  users.gender
FROM 
  bigquery-public-data.thelook_ecommerce.users as users
ORDER BY
  users.id ASC;