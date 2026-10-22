-- Uppgift 1g
-- Topp 5 län med flest beviljade ansökningar
-- Exkludera kategoring Flera kommuner

SELECT
    "LÄN",
    COUNT(*) AS ANTAL_BEVILJADE
FROM YH_APPLICATIONS_2025
WHERE "BESLUT" = 'Beviljad'
  AND "LÄN" <> 'Flera kommuner'
GROUP BY "LÄN"
ORDER BY ANTAL_BEVILJADE DESC, "LÄN"
FETCH FIRST 5 ROWS ONLY;

