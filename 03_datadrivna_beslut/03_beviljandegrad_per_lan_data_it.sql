-- Uppgift 3 - Fråga 3
-- Vilka lan har hogst beviljandegrad inom Data/IT?

SELECT
    LAN,
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
  AND LAN IS NOT NULL
  AND LAN <> 'Flera kommuner'
GROUP BY LAN
ORDER BY BEVILJANDEGRAD DESC;

-- Kalmar hade högst beviljandegrad med 100%,
-- Detta beror dock på endast en ansökan.
--
-- Bland län med minst 10 ansökningar hade
-- Stockholm flest beviljandegrad med 17.28% för Data/IT.
-- Skåne hade 11,54% och Västra Götaland 11,11%.
--
-- För Skool är Stockholm ett bra alternativ att undersökas,
-- Man bör även ta hänsyn till arbetsmarknadens behov 
-- samt antalet ansökningar i varje län. 

