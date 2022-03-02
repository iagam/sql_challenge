-- Alphabetically list all of the country codes in the continent_map table that appear more than once.
-- Display any values where country_code is null as country_code = "FOO" and make this row appear first in the list,
-- even though it should alphabetically sort to the middle. Provide the results of this query as your answer.

SELECT 
    COALESCE(country_code, 'FOO')
FROM
    continent_map
GROUP BY country_code
HAVING COUNT(*) > 1
ORDER BY country_code DESC
;


-- For all countries that have multiple rows in the continent_map table, delete all multiple records leaving only the 1 record per country.
-- The record that you keep should be the first one when sorted by the continent_code alphabetically ascending. 
-- Provide the query/ies and explanation of step(s) that you follow to delete these records.

