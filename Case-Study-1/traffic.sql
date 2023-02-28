WITH traffic_group AS (
  SELECT users.traffic_source as traffic,
    CASE WHEN users.traffic_source = 'Search' THEN 'Search'
         WHEN users.traffic_source = 'Organic' THEN 'Organic'
         WHEN users.traffic_source = 'Facebok' THEN 'Facebook'
         WHEN users.traffic_source = 'Display' THEN 'Display'
         WHEN users.traffic_source = 'Email' THEN 'Email'
         ELSE users.traffic_source END AS traffic_groups
  FROM bigquery-public-data.thelook_ecommerce.users as users
)
SELECT traffic_groups, COUNT(*) AS Total
FROM traffic_group
GROUP BY traffic_groups;