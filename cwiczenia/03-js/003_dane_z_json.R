library(rvest)
library(jsonlite)

#EX: Wczytaj stronę:

link <- "https://motomi.pl/oferty"

s <- html_session(link)

#Q1: Pobierz liczbe wszystkich ofert







































###
###
###

#Q1
link <- "https://motomi.pl/api/offers?page=0&pagesize=40"

s <- html_session(link)
s$response$content %>% 
  rawToChar %>% 
  fromJSON %>%
  extract2('totalElements')