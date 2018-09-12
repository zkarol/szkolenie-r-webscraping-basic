library(stringi)
library(rvest)
library(magrittr)

#EX: Wczytaj stronę:

link <- 'http://www.imdb.com/title/tt0109830/'

s <- html_session(link)

#Q1: Pobierz informacje o ratingu
#Q2: Pobierz informacje o gatunku
#Q3: Pobierz adres obrazka
#Q4: Pobierz informacje z tabeli z obsadą




































###
###
###

#Q1
s %>% html_nodes(".ratingValue > strong:nth-child(1) > span:nth-child(1)") %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

s %>% html_nodes(".ratingValue > strong") %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

s %>% html_nodes("span") %>% 
  .[!is.na(html_attr(., "itemprop"))] %>% 
  .[html_attr(., "itemprop") == "ratingValue"] %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

s %>% html_nodes("span:nth-child(1)") %>% 
  .[stri_detect_fixed(., "ratingValue")] %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

#Q2
s %>% html_nodes(".subtext > a:nth-child(5) > span:nth-child(1)") %>% html_text(trim = TRUE)
s %>% html_nodes(".subtext > a:nth-child(6) > span:nth-child(1)") %>% html_text(trim = TRUE)
s %>% html_nodes(".subtext > a:nth-child(7) > span:nth-child(1)") %>% html_text(trim = TRUE)

s %>% html_nodes(".subtext a span") %>% 
  html_text(trim = TRUE)

s %>% html_nodes(".subtext .itemprop") %>% 
  html_text(trim = TRUE)

#Q3
s %>% html_nodes(".poster > a:nth-child(1) > img:nth-child(1)") %>% html_attr("src")
s %>% html_nodes(".poster > a:nth-child(1) > img:nth-child(1)") %>% html_attrs %>% extract2(1) %>% extract2("src")
s %>% html_nodes(".poster > a:nth-child(1) > img:nth-child(1)") %>% html_attrs %>% lapply(extract2, "src")


### UWAGA !!!
s %>% html_nodes(".poster > img") %>% html_attr("src") #dlaczego puste?
s %>% html_nodes(".poster img") %>% html_attr("src")

#Q4
s %>% html_nodes(".cast_list") %>% html_table %>% extract2(1) %>% .[-1, c(2,4)]
  