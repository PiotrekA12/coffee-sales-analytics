# Analiza Sprzedaży i Optymalizacja Operacyjna Kawiarni (BI Case Study)

**Projekt**

Projekt End-to-End Business Intelligence symulujący rolę analityka dostarczającego strategiczne rekomendacje dla zarządu sieci kawiarni. 
Surowe dane transakcyjne zostały skonsolidowane, zweryfikowane pod kątem jakości, a następnie przekształcone w
interaktywną aplikację analityczną Power BI opartą o zoptymalizowaną strukturę bazy danych.



**Stack Techniczny**

SQL (MySQL): Silnik ETL bazy danych. Całość przekształceń wdrożono jako zoptymalizowany widok (podejście SQL-First odciążające Power BI).

Excel: Kontrola jakości miar bazowych i danych przed importem.

Power BI & DAX: Budowa wydajnego modelu danych w architekturze płaskiej bazy, implementacja miar biznesowych oraz autorski projekt UI/UX z dynamiczną nawigacją.


**Prezentacja Dashboardu**

1. Panel Strategiczny (Executive Sales Overview): Analiza trendów przychodów, KPI oraz struktury sprzedaży w czasie.

<img width="1331" height="749" alt="image" src="https://github.com/user-attachments/assets/6b9defd9-29aa-41d9-ae05-29a5caebbae6" />


2. Panel Operacyjny (Operational Insights): Szczegółowe zarządzanie grafikami pracy personelu oraz łańcuchem dostaw.
<img width="1305" height="733" alt="image" src="https://github.com/user-attachments/assets/0e249951-c3b1-4109-b533-560bada48d7d" />




**Kluczowe Osiągnięcia Techniczne**

Feature Engineering (SQL): Automatyczna segmentacja czasowa transakcji na okna operacyjne, dynamiczne przypisywanie sezonowości oraz kalkulacja binarnego wskaźnika dni roboczych/weekendów.

**Wnioski i Rekomendacje Biznesowe**

1. Eliminacja Letniego Spadku Przychodów 

Wniosek: Analiza wykazuje głęboki i nietypowy spadek obrotów w okresie letnim (spadek do $20k przychodów względem $29k wiosną). Oznacza to brak dopasowania oferty do temperatur.

Rekomendacja:  Natychmiastowe wdrożenie letniej linii produktów (np. Cold Brew, Iced Latte, rzemieślnicze napary gazowane) w celu monetyzacji ruchu w upalne dni.

2. Optymalizacja Kosztów Pracy

Wniosek: Najwyższy punkt obciążenia operacyjnego kawiarni przypada na segment wieczorny (Evening), generując aż 1 210 transakcji w dni robocze i 377 w weekendy, co zaprzecza tradycyjnym modelom pracy kawiarni.

Rekomendacja: Wydłużenie pełnej obsady baristów na godziny późno-popołudniowe i wieczorne (zamiast redukowania personelu pod koniec dnia) w celu skrócenia kolejek i maksymalizacji zysków.

3. Logistyka Mleka

Wniosek: Napoje mleczne stanowią filar sprzedaży (Latte generuje $28k przychodu przy średnim koszyku wynoszącym $34,84). Popyt na mleko osiąga krytyczny szczyt wieczorem.

Rekomendacja: Wdrożenie modelu PAR (restock przed popołudniową zmianą) w celu całkowitej eliminacji utraty zysków z powodu braku surowca.


