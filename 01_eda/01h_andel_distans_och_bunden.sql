-- Uppgift 1h
-- Andel distansutbildningar och bundna utbildningar
-- per utbildningsområde, uttryckt i procent

SELECT
    "UTBILDNINGSOMRÅDE",
    ROUND(
        100 * SUM(CASE
           WHEN "STUDIEFORM" = 'Distans'
           THEN 1 ELSE 0
        END) / COUNT(*), 2
    ) AS ANDEL_DISTANS,
    ROUND(
        100 * SUM(CASE
           WHEN "STUDIEFORM" = 'Bunden'
           THEN 1 ELSE 0
         END) / COUNT(*), 2
    ) AS ANDEL_BUNDEN
FROM YH_APPLICATIONS_2025
GROUP BY "UTBILDNINGSOMRÅDE"
ORDER BY "UTBILDNINGSOMRÅDE";


