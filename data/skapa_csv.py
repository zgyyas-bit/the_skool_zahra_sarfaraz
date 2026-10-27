import csv
import re
import unicodedata
from openpyxl import load_workbook

# Läs den rensade Excel-filen
wb = load_workbook("tabell_3_2025_rensad.xlsx", read_only=True, data_only=True)
ws = wb["Tabell 3"]
rows = iter(ws.values)

# Anpassa kolumnnamnen till SQL
def sql_namn(namn):
    namn = unicodedata.normalize("NFKD", str(namn))
    namn = namn.encode("ascii", "ignore").decode("ascii")
    return re.sub(r"[^a-zA-Z0-9]+", "_", namn).strip("_").lower()

rubriker = [sql_namn(namn) for namn in next(rows)]

# Skapa CSV-filen
with open("tabell_3_2025.csv", "w", newline="", encoding="utf-8") as fil:
    writer = csv.writer(fil)
    writer.writerow(rubriker)

    antal = 0
    for rad in rows:
        writer.writerow(["" if v is None else v for v in rad])
        antal += 1

print("CSV-filen har skapats!")
print("Antal kolumner:", len(rubriker))
print("Antal datarader:", antal)

