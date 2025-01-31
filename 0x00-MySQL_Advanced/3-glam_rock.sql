-- SQL script that lists all bands with Glam rock
-- as their main style, ranked by their longevity
-- Requirements: Import table dump: metal_bands.sql.zip
-- Column names: band_name and lifespan 
-- (in years until 2022 - use 2022 instead of YEAR(CURDATE()))
-- Yse attributes formed and split for computing the lifespan

SELECT band_name, (COALESCE(split, 2022) - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC
