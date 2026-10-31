-- Uppgift 4 - Tabell 8
-- Koppla ansokningar till kommuner

SET SQLBLANKLINES ON

-- Skapa kopplingstabellen
BEGIN
    EXECUTE IMMEDIATE '
        CREATE TABLE ANSOKAN_KOMMUN (
            DIARIENUMMER VARCHAR2(26) NOT NULL,
            KOMMUN_ID NUMBER NOT NULL,

            CONSTRAINT PK_ANSOKAN_KOMMUN
                PRIMARY KEY (DIARIENUMMER, KOMMUN_ID),

            CONSTRAINT FK_AK_ANSOKAN
                FOREIGN KEY (DIARIENUMMER)
                REFERENCES ANSOKAN(DIARIENUMMER),

            CONSTRAINT FK_AK_KOMMUN
                FOREIGN KEY (KOMMUN_ID)
                REFERENCES KOMMUN(KOMMUN_ID)
        )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -955 THEN
            RAISE;
        END IF;
END;
/

-- Importera kopplingar fran ursprungsdatan
-- Exkludera Flera kommuner eftersom exakt kommun saknas

MERGE INTO ANSOKAN_KOMMUN ak
USING (
    SELECT DISTINCT
        y.DIARIENUMMER,
        k.KOMMUN_ID
    FROM YH_APPLICATIONS_2025 y
    JOIN LAN l
        ON y.LAN = l.LAN_NAME
    JOIN KOMMUN k
        ON y.KOMMUN = k.KOMMUN_NAME
       AND k.LAN_ID = l.LAN_ID
    WHERE y.KOMMUN <> 'Flera kommuner'
      AND y.LAN <> 'Flera kommuner'
) n
ON (
    ak.DIARIENUMMER = n.DIARIENUMMER
    AND ak.KOMMUN_ID = n.KOMMUN_ID
)
WHEN NOT MATCHED THEN
    INSERT (DIARIENUMMER, KOMMUN_ID)
    VALUES (n.DIARIENUMMER, n.KOMMUN_ID);

COMMIT;

-- Kontrollera antalet kopplingar
SELECT COUNT(*) AS ANTAL_KOPPLINGAR
FROM ANSOKAN_KOMMUN;

-- Kontrollera att ingen ansokan har forsvunnit
SELECT COUNT(*) AS TOTALT_ANTAL_ANSOKNINGAR
FROM ANSOKAN;

-- Visa exempel pa kopplingar
SELECT
    a.DIARIENUMMER,
    a.UTBILDNINGSNAMN,
    k.KOMMUN_NAME,
    l.LAN_NAME
FROM ANSOKAN_KOMMUN ak
JOIN ANSOKAN a
    ON ak.DIARIENUMMER = a.DIARIENUMMER
JOIN KOMMUN k
    ON ak.KOMMUN_ID = k.KOMMUN_ID
JOIN LAN l
    ON k.LAN_ID = l.LAN_ID
FETCH FIRST 10 ROWS ONLY;
