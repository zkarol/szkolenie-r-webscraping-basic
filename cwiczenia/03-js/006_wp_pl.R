library(rvest)

link <- "http://www.wp.pl/"
s <- html_session(link)


# Dane znajduja sie w JSONie, ale nie jest tak łatwo uzyskać tego JSONA

dane <- s %>% 
  html_nodes("script") %>% 
  .[stringi::stri_detect_fixed(as.character(.), "window.PRELOAD")] %>% 
  html_text %>% 
  stringi::stri_extract_last_regex("(?<= window\\.PRELOAD = ).*\n.*") %>%
  paste0("}") %>%
  stringi::stri_replace_first_fixed("\n        'data'", '"data"') %>%
  jsonlite::fromJSON() %>%
  .[['data']]

dane$finances