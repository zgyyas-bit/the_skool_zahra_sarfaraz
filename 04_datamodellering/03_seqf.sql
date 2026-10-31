-- Uppgift 4 - Tabell 3
-- Skapa och fyll tabellen SEQF

-- Skapa tabellen om den inte redan finns
BEGIN
    EXECUTE IMMEDIATE '
        CREATE TABLE SEQF (
            SEQF_KOD NUMBER(3) PRIMARY KEY,
            EXAMENSTYP VARCHAR2(128) NOT NULL
        )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -955 THEN
            RAISE;
        END IF;
END;
/

-- Importera endast SEQF-nivaer som inte redan finns
MERGE INTO SEQF s
USING (
    SELECT DISTINCT
        SEQF_NIVA AS SEQF_KOD,
        EXAMENSTYP
    FROM YH_APPLICATIONS_2025
    WHERE SEQF_NIVA IS NOT NULL
) y
ON (s.SEQF_KOD = y.SEQF_KOD)

WHEN NOT MATCHED THEN
    INSERT (SEQF_KOD, EXAMENSTYP)
    VALUES (y.SEQF_KOD, y.EXAMENSTYP);

COMMIT;

-- Kontrollera resultatet
SELECT *
FROM SEQF
ORDER BY SEQF_KOD;

