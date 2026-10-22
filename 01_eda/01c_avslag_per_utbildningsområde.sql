-- Uppgift 1c
-- Antal avslagna ansökningar per utbildningsområde
-- Sorterat från flest till färst


SELECT
	"UTBILDNINGSOMRÅDE",
	COUNT(*) AS ANTAL_AVSLAGNA
FROM YH_APPLICATIONS_2025
WHERE "BESLUT" = 'Avslag'
GROUP BY  "UTBILDNINGSOMRÅDE"
ORDER BY ANTAL_AVSLAGNA DESC;

