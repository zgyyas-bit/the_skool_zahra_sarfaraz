-- Uppgift 1e
-- Antal avslagna ansökningar per utbildningsnamn inom Data/IT
-- Sortera från flest till färst

SELECT
    "UTBILDNINGSNAMN",
    COUNT(*) AS ANTAL_AVSLAGNA
FROM YH_APPLICATIONS_2025
WHERE "UTBILDNINGSOMRÅDE" = 'Data/IT'
  AND "BESLUT" = 'Avslag'
GROUP BY "UTBILDNINGSNAMN"
ORDER BY ANTAL_AVSLAGNA DESC;


