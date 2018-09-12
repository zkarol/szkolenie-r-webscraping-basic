library(stringi)
library(rvest)

#EX: Wczytaj stronę:

link <- 'http://bitcoin.pl/kurs'

s <- html_session(link)

#Q1: Pobierz informacje o kursie







































###
###
###

#Q1
s %>% html_nodes(".price > *") # !!!

s %>% html_nodes(".price") %>% stri_extract_first_regex("[0-9]+") %>% as.numeric

