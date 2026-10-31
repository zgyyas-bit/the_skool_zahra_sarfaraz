The Skool -SQL analys av YH-ansökningar 2025

Projekbeskrivning
I det här projektet analyseras år 2025 ansökninkgar till yrkeshögskoleutbildningar (YH) i Sverige.

Detta för att kunna hjälpa The Skool att fatta datadrivna beslut om vilka utbildningar som har  störst chans att beviljas och bör satsas på i framtiden.

Undersökningen gjordes med hjälp av SQL för att komma fram till vilka utbildningsområden som var populärast med flest ansökningar, vilka utbildningar som blivi beviljade/fått avslag samt hur resultatet skiljde sig beroende på län och studieform.

Dataset
Datasetet är en Excel-fil från Myndigheten för yrkeshögskolan (MYH) och innehåller resultatet av ansökningsomgången för år 2025. för denna projekt användes tabell 3 specifikt. Datasetet innehåller totalt 1184 ansökningar. Informationen som finns i datatsetet är allt från: utbildningsområde, utbildningsnamn, beslut (beviljande/avslag), utbildningsanordnare, län och kommun, studieform (distans/bunden) och YH-poäng.

Verktyg och tekniker
För denna projekt har följande verktyg använts:

* Oracle Database: För att lagra och analysera data.
* SQL: För att undersöka datasetet genom queries.
* Oracle Linux: Operativsystement där projektet genomfördes.
* Podman: För att köra Oracle Database i en container. 
* Vim: För att skapa och ändra SQL-filer.
* SQLcl: (orac) för att köra SQL-kommandon i terminalen.
* Git och Github: för att spara historik över ändringar och dokumentera.
* dbdiagram.io: för att skapa min datamodell med tabeller och relationer.    

Uppgift 1 - Resultatet av Analysfrågorna med hjälp av SQL

SQL användes för att undersöka datasetet från MYH. Bland annat analyserades antalet ansökningar, vilka  utbildningar som blev beviljade/fick avslag samt skillnader mellan olika län och studieform. 

* 1a - Antal ansökningar per utbildningsområde
COUNT(*) och GROUP BY användes för att räkna antalet ansökningar inom varje utbildningsområde. Resultatet visade 14 utbildningsområde och 1184 ansökningar. 
De områden med flest ansökningar är:

- Ekonomi, administration och försäljning: 239 ansökningar.
- Teknik och tillverkning: 221 ansökningar.
- Data/IT: 220 ansökningar.

* 1b - Beviljade ansökningar per utbildningsområde
Ansökningarna filtrerades med WHERE BESLUT = 'beviljad' för att räkna hur många som blev beviljade inom varje utbildningsområde.
Totalt blev 462 ansökningar beviljade där Teknik och tillverkning låg i top med flest beviljade ansökningar 113, medan Data/IT hade endast 31. 

* 1c - Avslag per utbildningsområde
Totalt fick 721 ansökningar avslag. i resultatet kunde vi se att Data/IT hade 189 avslag av totalt 220 ansökningar. 

* 1d - Beviljade utbildningsnamn inom Data/IT
WHERE, GROUP BY och COUNT(*) användes för att undersöka utbildningsnamnen inom Data/IT som hade beviljats. Resultatet visade 31 beviljade ansökningar fördelade på 30 olika utbildningsnamn. 

* 1e - Avslagna utbildningsnamn inom Data/IT
I Resultatet visades 189 avslagna ansökningar fördelade på 135 olika utbildningsnamn.

* 1f - Beviljade utbildningar per utbildningsanordnare
Jag grupperade efter utbildningsanordnare och utbildningsnamn för att sedan jämföra resultaten mellan olika anordnare.

* 1g - De fem länen med flest beviljade ansökningar
Här använde jag ORDER BY och FETCH FIRST 5 ROWS ONLY för att hittade fem länen med flest beviljanden. 
Resultatet visade att Stockholm och Västra Götaland hade flest med 89 beviljade ansökningar vardera. I andra plats låg Skåne med 45 beviljanden.

* 1h - Andel distansutbildningar och bundna utbildningar
Här Användes CASE WHEN, SUM() och ROUND() för att räkna ut procentandelen för distans och bundna utbildningar inom varje utbildningsområde. 
Inom Data/IT visade resultatet:

- Distansutbildningar: 24,55 %
- Bundna utbildningar: 75,45 % 

* 1i - Utbildningar som innehåller ordet AI
Jag undersökte hur många utbildningsnamn som innehöll ordet AI genom att först använda LIKE '%AI%' men upptäckte att det även gav träffar på ord som "Maintenanc"e och "Chain". Därför blev jag tvungen att använda REGEXP_LIKE() för att söka mer exakt efter AI som en separat del av namnet. 
Då visade resultatet 48 matchande ansökningar (från att först ha visat 56).
 
Sammanfattning av uppgift 1
Genom SQL-analysern kom vi fram till att Data/IT hade många ansökningar men få av dem hade beviljats. Man fick en klarare bild av konkurrenser inom olika utbildningsområden vilket gav en bra grund för fortsatt analys för The Skool. 

Uppgift 2 - Intervju med domänexpert

I denna uppgift försökte jag ta reda på vilka faktorer som kunde påverka beviljandet av en YH-utbildning. Ovanstående SQL analysen var grunde för mina intervjufrågor. 

1. Varför får så många ansökningar inom Data/IT avslag?
Domänexpernen menar att utbildningar inom Data/IT har mycket konkurrens eftersom många skolor ansöker om att starta liknande kurser. Allt efter förändringar i arbetsmarknadens behov kan vissa IT-kompetenser bli mer eftertraktade än andra. Antalet arbetstillfällen för nyexaminerade kan också påverka vilka utbildningar som beviljas. 
2. Vad kan en utbildningsanordnare göra för att öka chansen att få sin ansökan beviljad?
The Skool behöver visa att utbildningen verkligen behövs på arbetsmarknaden. Det kan de göra genom att samarbeta med företag, samla in information om kompetensbrist och utforma utbildningar tillsammans med arbetsgivare.
Det är också viktigt att ansökan är tydlig och att utbildningens innehåll motsvarar de kunskaper som företagen faktiskt behöver.

3. Varför får vissa län fler utbildningar beviljade än andra?
Domänexperten lyfte fram tre möjliga faktorer: större arbetsmarknad, fler utbildningsanordnare och större behov av utbildad personal.
Dessutom skickas det ofta in fler ansökningar från dessa län, vilket kan bidra till att fler utbildningar blir beviljade.

Slutsatsen från intervjun är att antalet beviljande utbildningar inte bara handlar om hur många ansökningar som skickats in, utan arbetsmarknadens behov, konkurrens och samarbete med arbetsgivare är också viktiga faktorer.
 
Uppgift 3 - Datadrivet beslut för The Skool

Baserat på resultatet från uppgift 1 och intervjun formulerade jag här tre analysfrågor för att hjälpa The Skool med framtida ansökningar om YH-utbildningar.

1. Vilka utbildningsområden har högst beviljandegrad?

Jag använde SQL med COUNT(*), SUM(), CASE WHEN och ROUND() för att beräkna andelen beviljade ansökningar inom varje utbildningsområde.

Resultat:

- Transporttjänster hade högst beviljandegrad med 64,29 %, men endast 14 ansökningar.
- Teknik och tillverkning hade 52,94 % beviljandegrad.
- Data/IT hade lägst beviljandegrad med 14,09 %, där endast 31 av 220 ansökningar beviljades.

Slutsats:

Data/IT hade en betydligt lägre beviljandegrad än många andra utbildningsområden. För The Skool är det därför viktigt att ha koll på arbetsmarknadens behov och konkurrensen innan man bestämmer sig för att starta en IT-utbildning.

2. Har distansutbildningar eller bundna utbildningar högst beviljandegrad inom Data/IT?

SQL användes för att jämföra antalet och beviljadet av dessa två studieformerna inom Data/IT utbildningar.

Resultatet visar fler ansökningar (166) och beviljande (27) för bunden studiefor i jämförelse med distans som har endast 54 ansökningar och 4 beviljanden. 

Slutsats:

Bundna utbildningar hade mer än dubbelt så hög beviljandegrad som distansutbildningar inom Data/IT under 2025. The Skool kan därför undersöka bundna utbildiningsalternativ närmare.

3. Vilka län har högst beviljandegrad inom Data/IT?

Jag använde GROUP BY, COUNT(*), SUM() och ORDER BY för att beräkna och jämföra beviljandegraden mellan olika län.

Resultatet visade följande:

- Kalmar hade 100 % beviljandegrad, men endast en ansökan.
- Kronoberg hade 50 %, baserat på två ansökningar.
- Stockholm hade 17,28 %, med 14 beviljade av 81 ansökningar.
- Skåne hade 11,54 %, med 3 beviljade av 26 ansökningar.
- Västra Götaland hade 11,11 %, med 4 beviljade av 36 ansökningar.

Kalmar visar högst beviljandegrad i procent men det beror på för få ansökningar.Bland länen med minst tio ansökningar hade Stockholm högst beviljandegrad. Därför bör The Skool titta närmare på Stockholm i hänsyn till arbetsmarknaden. 

ovanstående resultat bygger på ansökningsomgången 2025 och kan inte garantera samma resultat i framtiden.

Uppgift 4 - Datamodellering (BONUS)

I den här uppgiften hade läraren lagt upp ett färdigt ER-diagram som jag använde för att skapa datamodell med åtta relaterade tabeller i Oracle SQL.
Ursprungsdatan innehöll 1184 ansökningar låg enligt tabellen YH_applications_2025. informationen från tabellen delades upp i åtta olika tabeller för att minska upprepningar och skapa tydligare relationer mellan entiteterna. 

De åtta tabellerna 

1. UTBILDNINGSOMRADE – innehåller 14 utbildningsområden.
2. SUN5_INRIKTNING – innehåller 200 SUN5-inriktningar och deras koppling till utbildningsområden.
3. SEQF – innehåller SeQF-nivåer och examenstyper.
4. UTBILDNINGSANORDNARE – innehåller 242 utbildningsanordnare.
5. ANSOKAN – innehåller de 1 184 ansökningarna, inklusive utbildningsnamn, beslut och studieform.
6. LAN – innehåller 20 län.
7. KOMMUN – innehåller 94 kommuner och deras koppling till respektive län.
8. ANSOKAN_KOMMUN – kopplingstabell mellan ansökningar och kommuner.

Primärnycklar och främmande nycklar

Datamodellen har sina primärnycklar (PK) för att identifiera poster unikt och främmande nycklar (FK) för att koppla samman tabellerna. till exempel är ANSOKAN kopplad till SUN5_INRIKTNING, SEQF och UTBILDNINGSANORDNARE.
tabellen KOMMUN är i sin tur kopplad till LAN, och ANSOKAN_KOMMUN kopplar ihop ansökningar med kommuner. I kopplingstabellen används en sammansatt primärnyckel som ser till att samma ansökan inte kopplas till samma kommun flera gånger.

Import och kontroll av data 

SQL användes för att skapa tabellerna och importera info från YH_APPLICATIONS_2025. importen kontrollerades sedan för tt se till att antalet poster och relationerna stämde med ursprungsdatan. 

Det är värt att nämna att i 295 stycken ansökningar framgick inga specifika kommuner utan de hade värdet Flera kommuner. Jag ville inte komma med påhittade kommunkopplingar vilket är varför de 295 ansökningarna finns kvar i ANSOKAN medan övriga 889 ansökningar har kopplats till sina angivna kommuner.  

SQL-frågor med den nya datamodellen

När åtta tabeller hade skapats, gick jag vidare med att åter igen besvara frågorna 1a-1i från uppgift 1. Den här gången genom den nya datamodellen och JOIN för att hämta info från flera tabeller. Resultatet jämfördes med ursprungsdatan för att kontrollera att allt stämde. 
Några exempel på verifierade resultat:

- Totalt 1 184 ansökningar fördelade på 14 utbildningsområden.
- Data/IT hade 220 ansökningar, varav 31 beviljades.
- Stockholm och Västra Götaland hade flest beviljade ansökningar bland länen med angiven kommun, 89 vardera.
- Inom Data/IT var 75,45% av ansökningarna för bundna utbildningar och 24,55% för distans.
- Med REGEXP_LIKE hittade jag 48 ansökningar med AI som ett självständigt ord i utbildningsnamnet. 

Reflektion

Under uppgiftens gång fick jag arbeta med PK, FK, kopplingstabeller och JOIN. Jag fick bättre förståelse för  hur en datamodell med flera tabeller funkar i praktiken. Jag lärde mig också hur viktig det är att inte skapa relationer när nödvändigt info saknas.

SQL-filerna för de åtta tabellerna och de nio analysfrågorna finns i mappen 04_datamodellering/.




