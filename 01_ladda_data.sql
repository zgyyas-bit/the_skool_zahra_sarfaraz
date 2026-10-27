-- Öka kolumnens storlek
ALTER TABLE YH_APPLICATIONS_2025
MODIFY (UTBILDNINGSOMRADE VARCHAR2(100 CHAR));

-- Läs in CSV-data i befintlig Oracle-tabell
SET LOADFORMAT CSV

LOAD YH_APPLICATIONS_2025 /work/data/tabell_3_2025.csv

COMMIT;

-- Kontrollera antal rader
SELECT COUNT(*) AS antal_rader
FROM YH_APPLICATIONS_2025;


