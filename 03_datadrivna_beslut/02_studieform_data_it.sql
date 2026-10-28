-- Uppgift 3 - Fråga 2
-- Har distansutbildningar eller bundna utbildningar
-- högst beviljandegrad inom Data/IT?

SELECT
    STUDIEFORM,
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
WHERE UTBILDNINGSOMRADE = 'Data/IT'
GROUP BY STUDIEFORM
ORDER BY BEVILJANDEGRAD DESC;

-- Slutsats:
-- Bundna utbildningar hade 16,27 % beviljandegrad
-- medan distansutbildningar hade 7,41 %.
-- The Skool kan därför dra fördel av denna statistik
-- och undersöka bundna utbildningar närmare
-- inför framtida ansökningar.

