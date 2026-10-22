-- Uppgift 1a
-- Antal ansökningar per utbildningsområde
-- Sorterat fron flest till färst ansökningar


SELECT
	UTBILDNINGSOMRÅDE,
	COUNT(*) AS ANTAL_ANSÖKNINGAR
FROM YH_APPLICATIONS_2025
GROUP BY UTBILDNINGSOMRÅDE
ORDER BY ANTAL_ANSÖKNINGAR DESC;

