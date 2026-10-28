-- Uppgift 3 - Fråga 1
-- Vilka utbildningsområden har högst beviljandegrad?

-- Uppgift 3 - Fraga 1
-- Vilka utbildningsomraden har hogst beviljandegrad?

SELECT
    UTBILDNINGSOMRADE,
    COUNT(*) AS ANTAL_ANSOKNINGAR,
    SUM(CASE
        WHEN BESLUT = 'Beviljad' THEN 1
        ELSE 0
    END) AS ANTAL_BEVILJADE,
    ROUND(
        100 * SUM(CASE
            WHEN BESLUT = 'Beviljad' THEN 1
            ELSE 0
        END) / COUNT(*), 2
    ) AS BEVILJANDEGRAD
FROM YH_APPLICATIONS_2025
GROUP BY UTBILDNINGSOMRADE
ORDER BY BEVILJANDEGRAD DESC;

-- Slutsats:
-- Data/IT hade låg beviljandegrad på 14,09 %.
-- Endast 31 av 220 ansökningar blev beviljade.
-- Teknik och tillverkning hade 52,94 %.
-- Detta visar att konkurrensen kan skilja sig
-- mellan olika utbildningsområden.
-- Det bästa för Skool är att först undersöka
-- arbetsmarknadens behov innan de väljer vilka utbildningar
-- de ska ansöka om.


