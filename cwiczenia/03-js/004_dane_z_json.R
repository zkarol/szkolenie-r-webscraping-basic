library(rvest)

#EX: Wczytaj stronę:

link <- "http://dziennikmz.mz.gov.pl/"

s <- html_session(link)

#Q1: Pobierz dane z tabeli dla 2016 roku








































###
###
###

#Q1

s <- html_session('http://dziennikmz.mz.gov.pl/api/positions/2016/0/true',
                  add_headers(`RequestVerificationToken` = "authentication123"))
dane <- s$response$content %>% 
  rawToChar %>% 
  fromJSON %>%
  extract2('positions')