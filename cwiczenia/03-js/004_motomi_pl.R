library(rvest)

link <- "https://motomi.pl/oferty"
s <- html_session(link)

# Q1: Pobierz liczbe wszystkich ofert











































###

require(jsonlite)

# Q1
link <- "https://motomi.pl/api/offers?page=0&pagesize=40"
s <- html_session(link)

s$response$content %>% 
  rawToChar %>% 
  fromJSON %>%
  extract2('totalElements')