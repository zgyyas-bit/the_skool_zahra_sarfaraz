-- Importera YH-data från CSV till Oracle
LOAD YH_APPLICATIONS_2025 /work/data/tabell_3_2025.csv NEW

-- Kontrollera antal importerade rader
SELECT COUNT(*) AS antal_rader
FROM YH_APPLICATIONS_2025;

