library(rvest)
library(stringi)

#EX: Wczytaj stronę:

link <- "http://www.filmweb.pl/film/W+starym%2C+dobrym+stylu-2017-744484"

s <- html_session(link)

#Q1: Pobierz średnia ocene







































###
###
###

#Q1

s %>% html_nodes("*") %>% .[stri_detect_fixed(.,"7,1")]

s %>% html_node("span[itemprop='ratingValue']") %>% html_text(trim = TRUE)



# http://3.fwcdn.pl/js/3c237af549fad729bcc0d558f409e653.md5.js
# ratingRateValue > communityRateInfo
# http://www.filmweb.pl/film/W+starym%2C+dobrym+stylu-2017-744484

s %>% 
  html_node("#filmVoteRatingPanel + script") %>% 
  html_text %>%
  stri_extract_first_regex('(?<=communityRateInfo:")[0-9,]+')
