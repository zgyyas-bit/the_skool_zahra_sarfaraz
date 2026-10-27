from openpyxl import load_workbook

# Öppna originalfilen
wb = load_workbook("tabell_3_2025.xlsx")

# Hitta Tabell 3
print("Tillgängliga blad:", wb.sheetnames)

tabell = next(
    (namn for namn in wb.sheetnames
     if namn.strip().lower().replace(" ", "") == "tabell3"),
    None
)

if tabell is None:
    raise SystemExit("Tabell 3 hittades inte!")

# Ta bort alla andra blad
for namn in wb.sheetnames:
    if namn != tabell:
        del wb[namn]

# Ta bort de första 6 raderna
ws = wb[tabell]
ws.delete_rows(1, 6)

# Spara resultatet i en ny fil
wb.save("tabell_3_2025_rensad.xlsx")

print("Klart! Endast Tabell 3 finns kvar.")
print("Antal rader:", ws.max_row)

