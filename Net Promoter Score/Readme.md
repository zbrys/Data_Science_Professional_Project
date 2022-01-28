# CDV Data Science Professional Project
## Projekt zaliczeniowy

# Analiza NPS
## Autor: Ryszard Siwy

### Spis treści
* Opis
* Dokumentacja danych
* Opis danych
* Wymagania uruchomieniowe
* Analiza NPS
* Pliki

## Opis
Net Promoter Score (NPS) – narzędzie oceny lojalności klientów danej firmy. Jest alternatywną metodą oceny dla tradycyjnych badań satysfakcji klientów. 
Zakłada się, że wartość NPS jest skorelowana ze wzrostem przychodów. 
Wartości NPS wahają się pomiędzy -100 i +100, przy czym -100 odpowiada sytuacji gdy każdy z badanych klientów jest krytykiem danej marki niepolecającym jej innym, a +100 odpowiada sytuacji gdzie każdy promuje – jest gotów polecić – daną markę znajomym. Wartości dodatnie NPS uznawane są za wynik dobry a wartości powyżej 50 za doskonały. 

## Dokumentacja danyc
Dane zostały dostarczone w postaci kwestionariusza z opisem pytań, dane zostały dostarczone w postaci pliku tekstowego w formacie CSV.

## Opis danych
Plik zawiera 167 kolumn oraz 200 wierszy. Wartości w pliku CSV są odzielane średnikami. Kluczowe informacje dotyczące pliku ze zbiorem danych:
* dane reprezentują odpowiedzi 200 respondentów
* dane miejscami zawierają brakujące informacje (NA)
* dane posiadają wartości skończone niemniej występują w nich wartości nie mające nic wspólnego z naszą analizą.
    
# Wymagania uruchomieniowe
* RStudio 
* R wersja 4.1.2
* Microsoft Excel

Analiza NPS
Na podstawie przeprowadzonej analizy oraz przedstawionych danych można stwierdzić następujące fakty:
•	W analizie występuje zdecydowana większość detraktorów.
•	Najwyższy wynik NPS zanotowano dla marki Goździk (-14,74) zaś najniższy dla marki Dzwonek (-54,26)
•	Wyniki NPS dla wszystkich marek znajdują poniżej zera, średnia wartość NPS -34,88. Można próbować postawić wniosek że jest to type dla tej branży. 

## Pliki
Grupa.5.csv - oryginalny plik z danymi dla grupy 5
Kwestionariusz.Grupa.5.docx - kwestionariusz opisujący interpretację danych.
Grupa_5_clean.csv - plik przetworzony za pomocą skryptu projekt_Gr5_cleaning_data.R.
projekt_Gr5_cleaning_data.R - Skrypt R służący do wyczyszczenia pliku źródłowego i przystosowania go do analizy.
result_NPS.csv - Surowe dane do analizy NPS.
result_NPS.xlsx - Analiza NPS rzeprowadzona w programie excel.
