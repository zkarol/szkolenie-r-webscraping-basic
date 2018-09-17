library(rvest)

link <- 'https://www.cadth.ca/about-cadth/what-we-do/products-services/cdr/reports'
s <- html_session(link)

#Q 1: Wczytaj dane z tabeli dla wszystkich stron











































###

# Q1
wyniki <- s %>%
  html_node("table") %>%
  html_table  
