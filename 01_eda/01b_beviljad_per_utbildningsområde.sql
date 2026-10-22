-- Uppgift 1b
-- Antal beviljade ansökningar per utbildningsområde
-- sorterat från flest till färst

SELECT 
	"UTBILDNINGSOMRÅDE",
	COUNT(*) AS ANTAL_BEVILJADE
FROM YH_APPLICATIONS_2025
WHERE "BESLUT" = 'Beviljad'
GROUP BY "UTBILDNINGSOMRÅDE"
ORDER BY ANTAL_BEVILJADE DESC;


