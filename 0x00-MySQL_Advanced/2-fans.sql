-- SQL script that ranks country origins of bands
-- Import table dump: metal_bands.sql.zip
-- Column names must be: origin and nb_fans
-- Your script can be executed on any database

SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC
