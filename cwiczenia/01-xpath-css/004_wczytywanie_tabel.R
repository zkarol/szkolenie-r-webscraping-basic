library(rvest)
library(stringi)
library(tesseract) # https://github.com/ropensci/tesseract
library(magick)    # https://github.com/ropensci/magick

#EX: Wczytaj stronę:

link <- 'https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania'

s <- html_session(link)

#Q1: Pobierz 10 pierwszych wierszy z tabeli
#Q2: Do uzyskanej tabeli dodaj kolumne z typem funduszu
#Q3: Uzupełnij kolumnę j.u. netto o link do obrazka
###Q4: Czy da się coś z tym zrobić? (AD. Q3)


































###
###
###

#Q1
notowania <- s %>% 
  html_node("#noteTable") %>% 
  html_table(header = TRUE) %>% 
  .[,-1] %>% 
  set_colnames(.[1,]) %>% 
  .[-1,] %>% 
  head(10)

#Q2
notowania$typ <- s %>% 
  html_nodes("tr > :first-child > img") %>%
  html_attr("title") %>%
  head(10)

notowania$typ <- s %>% 
  html_nodes("tbody .segment img") %>%
  html_attr("title") %>%
  head(10)

#Q3
notowania$`j.u. netto` <- s %>% 
  html_nodes("tbody tr > :nth-child(4) > img") %>%
  html_attr("src") %>%
  head(10) %>%
  paste0("https://www.analizy.pl", .)

### dodatek

engine <- 
  tesseract(options = list(tessedit_char_whitelist = " 0123456789,.",
                           tessedit_char_blacklist = "!?@#$%&*()<>_-+=/:;'\"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\n\t\r",
                           classify_bln_numeric_mode = "1"))

#TEST
i=10
notowania$`j.u. netto`[i] %>%
  image_read %>%
  image_resize("130")
notowania$`j.u. netto`[i] %>%
  image_read %>%
  image_resize("130") %>%
  ocr(engine) %>%
  stri_replace_all_regex("[ \n]", "") %>%
  as.numeric

notowania$wartoscjunetto <-
  notowania$`j.u. netto` %>%
  sapply(function(x) x %>%
           image_read %>%
           image_resize("130") %>%
           ocr(engine) %>%
           stri_replace_all_regex("[ \n]", "")) %>% 
  as.vector

notowania$wartoscjunetto[!stri_detect_fixed(notowania$wartoscjunetto, ".")] <- as.numeric(notowania$wartoscjunetto[!stri_detect_fixed(notowania$wartoscjunetto, ".")]) / 100
