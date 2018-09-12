library(rvest)

#EX: Wczytaj stronę:

link <- "http://wiadomosci.onet.pl/"

s <- html_session(link)

#Q1: Pobierz nagłówki artykułów
#Q2: Pobierz nagłówki artykułów z kolejnych stron







































###
###
###

#Q1
s %>% 
  html_nodes(".itemTitle") %>% 
  html_text(trim = TRUE)

#Q2
link <- "http://wiadomosci.onet.pl/?strona=5"
s <- html_session(link)
s %>% 
  html_nodes(".itemTitle") %>% 
  html_text(trim = TRUE)

link <- "http://wiadomosci.onet.pl/?ajax=1&page=2"
s <- html_session(link)
s %>% 
  html_nodes(".itemTitle") %>% 
  html_text(trim = TRUE)
