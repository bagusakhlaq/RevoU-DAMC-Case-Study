/* 1. CHECK FOR DUPLICATION */
SELECT 
    COUNT([column]) - COUNT(DISTINCT [column]) as dup
FROM
    `bigquery-public-data.thelook_ecommerce.[table_name]` as [alias];

/* 2. CHECK FOR NULL RECORDS*/
SELECT * FROM bigquery-public-data.thelook_ecommerce.[table_name]
WHERE
    [column_1] IS NULL OR
    [column_2] IS NULL OR
    ...;

/* 3. CHECK FOR STRING LENGTH AND MISSPELLS*/
/* ----------------------------------------------- */
/* CHECKING ID LENGTH DATA. SINCE THE ID DATA TYPE WAS INT64,
I NEEDED TO CONVERT THE DATA TYPE INTO STRING FIRST. */
SELECT DISTINCT
    LENGTH(CAST([id_column] as STRING)) as len_id
FROM
    `bigquery-public-data.thelook_ecommerce.[table_name]`;

/* ----------------------------------------------- */
/* CHECK FOR CITY, STATE, AND COUNTRY CONSISTENCY*/
SELECT DISTINCT
    [strColumnName]
FROM
    `bigquery-public-data.thelook_ecommerce.[table_name]`;

/* ----------------------------------------------- */

/* 4. CREATING A TEMP TABLE TO MANIPULATE INCONSISTENCY
IN COUNTRY FIELDS*/
WITH users_cl AS (
    SELECT CASE
        WHEN country = "España" THEN country = "Spain"
        WHEN country = "Deutschland" THEN country = "Germany"
    ELSE users_cl END
)

/* 5. CHECK FOR EMAIL */
 WITH user_temp AS (
    SELECT
      id,
      first_name,
      last_name,
      email
    FROM
      `bigquery-public-data.thelook_ecommerce.users`
  )
  SELECT
    id,
    first_name,
    last_name,
    email,
    REGEXP_EXTRACT(email, r'^(.*?)@') as name,
    LEFT(REGEXP_EXTRACT(email, r'^(.*?)@'), LENGTH(first_name)) as surname,
    RIGHT(REGEXP_EXTRACT(email, r'^(.*?)@'), LENGTH(last_name)) as fam_nam,
    REGEXP_EXTRACT(email, r'[.@](.*?)\.') as comp,
    RIGHT(email, 3) as dom
  FROM
    user_temp
  LIMIT 10;