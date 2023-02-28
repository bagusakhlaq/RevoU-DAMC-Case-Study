WITH age_group AS (
  SELECT users.age,
    CASE WHEN users.age>=12 AND users.age<=17 THEN '12-17'
         WHEN users.age>=18 AND users.age<=24 THEN '18-24'
         WHEN users.age>=25 AND users.age<=34 THEN '25-34'
         WHEN users.age>=35 AND users.age<=44 THEN '35-44'
         WHEN users.age>=45 AND users.age<=54 THEN '45-54'
  		 WHEN users.age>=55 AND users.age<=64 THEN '55-64'
         ELSE '>65' END as age_groups, users.gender as gender
  FROM bigquery-public-data.thelook_ecommerce.users as users
)
SELECT age_groups, COUNT(*) as total, gender,
	CASE WHEN gender = 'F' THEN 'Female'
		 ELSE 'Male' END as genders
FROM age_group
GROUP BY age_groups, gender;