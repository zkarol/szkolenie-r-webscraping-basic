library(rvest)
library(httr)
library(readr)
library(rlist)

#EX: Wczytaj stronę:

link <- "https://www.whoscored.com/Regions/252/Tournaments/2/England-Premier-League"

s <- GET(link) #niestety rvest z niewiadomego mi powodu sie sypie...

#Q1: Pobierz dane





































###
###
###

#Q1

readr::write_file(s$content %>% rawToChar, "examples/ex4-js/006-log1.txt")

s <- GET(link) # wykonujemy dwa razy (ma to pewnie zwiazek z ciasteczkami)

readr::write_file(s$content %>% rawToChar, "examples/ex4-js/006-log2.txt")

# proba wyciagniecia jakichs danych...

tmp <- s$content %>% 
  rawToChar %>%
  read_html %>% 
  html_nodes("*") %>% 
  .[stri_detect_fixed(.,"DataStore.prime('ws-stage-stat', ")] %>%
  html_text(trim=TRUE) %>%
  extract(6)
  
readr::write_file(tmp, "examples/ex4-js/006-log3.txt")

tmp %>% stri_extract_first_regex("[\\[]{3}.*[\\]]{3}") %>%
  stri_split_fixed("],[") %>%
  extract2(1) %>%
  stri_replace_all_regex("[\\[\\]]", "") %>%
  lapply(function(x) unlist(stri_split_regex(x, "(',)|(,')"))) %>%
  rlist::list.rbind()