WITH country_group AS (
  SELECT users.country,
    CASE WHEN users.country = 'United States' THEN 'US'
         WHEN users.country = 'South Korea' THEN 'S.Korea'
         WHEN users.country = 'United Kingdom' THEN 'UK'
         WHEN users.country = 'España' THEN 'Spain'
         WHEN users.country = 'Deutschland' THEN 'Germany'
         ELSE users.country END AS country_groups
    FROM bigquery-public-data.thelook_ecommerce.users as users
)
SELECT country_groups, COUNT(*) AS TOTAL
FROM country_group
GROUP BY country_groups