-- Uppgift 1i
-- Antal ansökningar som innehåller ordet AI
-- Söker efter AI som ett separat ord
-- för att undvika träffar som Maintenance och Chain

SELECT
    COUNT(*) AS ANTAL_AI_ANSOKNINGAR
FROM YH_APPLICATIONS_2025
WHERE REGEXP_LIKE(
    "UTBILDNINGSNAMN",
    '(^|[^[:alnum:]])AI([^[:alnum:]]|$)',
    'i'
)
ORDER BY "UTBILDNINGSNAMN";


