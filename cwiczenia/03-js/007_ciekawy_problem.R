library(magrittr)
library(rvest)

#EX: Wczytaj stronę:

link <- "http://www.wp.pl/"

s <- html_session(link)


# Dane znajduja sie w JSONie, ale nie jest tak łatwo uzyskać tego JSONA

dane <- s %>% 
  html_nodes("script") %>% 
  .[stringi::stri_detect_fixed(., "window.PRELOAD")] %>% 
  html_text %>% 
  stringi::stri_extract_last_regex("(?<= window\\.PRELOAD = ).*\n.*") %>%
  stringi::stri_replace_last_fixed(",", "}") %>%
  stringi::stri_replace_first_fixed("\n        'data'", '"data"') %>%
  jsonlite::fromJSON()




# tadam
dane$data$teasers$`39`