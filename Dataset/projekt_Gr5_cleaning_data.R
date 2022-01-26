# ustalenie katalogu roboczego
getwd()
#setwd("C:/Users/ryszard.siwy/Documents/studia/DS profesional project/Projekt")

# Zaadowanie koniecznych bibliotek
library(dplyr)
library(tidyr)
library(ggplot2)

# Import pliku z danymi, kodowanie UTF-8
df <- read.csv2("Grupa.5.csv", encoding="UTF-8")

# Pozbycie się rekordów z wartoscią 102 lub 999 w polu T1
df %>% filter(T1 == 101) -> df2

# Zmiana typu na numeryczną w polu T5a
df2$T5A <- sub(",", ".", df2$T5A) 
df2$T5A <- sub(" ", "", df2$T5A) 

df2$T5A <- sapply(df2$T5A, as.numeric)

# Pozbycie się odpowiedzi które nie spełniają warunku areału < 5ha
df2 %>% filter(T5A > 5) %>%
  filter(T5B >= 5) -> df3

# removing unnecesary columns
drop = c(1:38)
df4 <- df3[-drop]
drop = c(89:129)
df4 <- df4[-drop]

# Dodanie tekstowej kolumny wykształcenie T3LB
edu_labels = c("Wyższe rolnicze", "Wyższe", "Średnie techniczne",
               "Średnie ogólne", "Inne", "Brak odpowiedzi")
edu_levels = c(101,102, 103, 104, 994, 999)

df4 <- mutate(df4, T3LB = T3)

df4$T3LB <- factor(df4$T3LB,  levels = edu_levels, labels = edu_labels)


# Dodanie kolumny tekstowej stanowisko
ocu_labels = c("Dyrektor/wicedyrektor", "Główny agronom", "Agronom ekspert",
               "Właściciel", "Pracownik techniczny", "Inna", "Brak odpowiedzi")
ocu_levels = c(101, 102, 103, 104, 105, 994, 999)

df4 <- mutate(df4, T4LB = T4)

df4$T4LB <- factor(df4$T4LB, levels = ocu_levels, labels = ocu_labels)

# Dodanie kolumny tekstowej z grupami powieżchni, dla zasiewów poprzednich
# i planowanych
df4 <- mutate(df4,
              T5ALB = case_when(
                 T5A <= 25 ~ "A",
                 between(T5A, 25.001, 50) ~ "B",
                 between(T5A, 50.001, 100) ~ "C",
                 between(T5A, 100.001, 250) ~ "D",
                 T5A >= 250.001 ~ "E")
            )

df4$T5ALB <- factor(df4$T5ALB,
                    levels = c("A", "B", "C", "D", "E"),
                    labels = c("mniej niż 25 ha", "25.01 - 50 ha", 
                               "50.01 - 100 ha", "100.01 - 250 ha", 
                               "więcej niż 250 ha")
)


df4 <- mutate(df4,
              T5BLB = case_when(
                T5B <= 25 ~ "A",
                between(T5B, 25.001, 50) ~ "B",
                between(T5B, 50.001, 100) ~ "C",
                between(T5B, 100.001, 250) ~ "D",
                T5B >= 250.001 ~ "E")
)

df4$T5BLB <- factor(df4$T5BLB,
                    levels = c("A", "B", "C", "D", "E"),
                    labels = c("mniej niż 25 ha", "25.01 - 50 ha", 
                               "50.01 - 100 ha", "100.01 - 250 ha", 
                               "więcej niż 250 ha")
)

# adding text column T2A1 with the age period
df4$T2A1 =2022 - df4$T2
df4 <- mutate(df4, 
              T2LBL = case_when(
                T2A1 <= 30 ~ "mniej niż 30",
                between(T2A1, 30.1, 40) ~ "31 - 40",
                between(T2A1, 40.1, 50) ~ "41 - 50",
                between(T2A1, 50.1, 60) ~ "51 - 60",
                T2A1 >= 60.1 ~ "powyżej 60"))

# write prepared data to disk
write.csv2(df4, file = 'Grupa_5_clean.csv', fileEncoding = 'UTF-8')

