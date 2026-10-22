-- Uppgift 1d
-- Antal beviljade ansökningar per utbildningsnamn inom Data/IT
-- Sortera från flest till färst


SELECT
    "UTBILDNINGSNAMN",
    COUNT(*) AS ANTAL_BEVILJADE
FROM YH_APPLICATIONS_2025
WHERE "UTBILDNINGSOMRÅDE" = 'Data/IT'
  AND "BESLUT" = 'Beviljad'
GROUP BY "UTBILDNINGSNAMN"
ORDER BY ANTAL_BEVILJADE DESC;


