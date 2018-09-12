library(httr)
library(rvest)

#EX: Wczytaj stronę:

link <- 'http://kolejki.nfz.gov.pl/Informator/Index/'

s <- html_session(link)

#Q1: Czy można w szybki sposób pobrać te dane? (rozejrzyj sie po stronie)
#Q2: W jaki sposób można pobrać dane dostepne prze forularz?






































###
###
###

#Q2

### Wyjatkowo metoda POST zamiast GET (link) co powoduje, że trzeba skorzystać z httr zamiast rvest

### Pierwsza strona (na potrzeby zidentyfikowania id sesji)

s <- httr::POST(link, 
                add_headers(`Content-Type` = "application/x-www-form-urlencoded"), ### ważne!!!
                body = "IdOwNfz=3&Swiadczenie=&Miejscowosc=&Swiadczeniodawca=&Miejsce=&Ulica=&isSzpital=true")
s$content %>% 
  rawToChar %>% 
  read_html %>%
  html_nodes(".kolejka_nazwa") %>% 
  html_text(trim = TRUE)

### Kolejne strony

pg <- 10
s <- httr::POST(paste0("http://kolejki.nfz.gov.pl/Informator/InformatorPage/?Page=", pg), 
                add_headers(`Content-Type` = "application/x-www-form-urlencoded"), 
                body = "X-Requested-With=XMLHttpRequest")
s$content %>% 
  rawToChar %>% 
  read_html %>%
  html_nodes(".kolejka_nazwa") %>% 
  html_text(trim = TRUE)