library(rvest)
library(httr)

link1 <- "http://biathlonresults.com/"

link2 <- "http://www.wtatennis.com/stats"

link3 <- "http://www.zus.pl/baza-wiedzy/statystyka/wazniejsze-informacje-z-zakresu-ubezpieczen-spolecznych-fundusz-ubezpieczen-spolecznych"

link4 <- "https://kody.poczta-polska.pl"







































# s <- html_session(link3)
# s %>% html_nodes("li.b-row") %>% html_nodes("p") %>% html_text(trim = TRUE)
# s %>% html_nodes("li.b-row") %>% html_nodes("a") %>% html_attr("href") %>% paste0("www.zus.pl", .)
# # downloader:download

# s <- httr::POST(link4, 
#                 add_headers(`Content-Type` = "application/x-www-form-urlencoded"), ### ważne!!!
#                 body = "kod=30-126&page=kod")
# s$content %>% 
#   rawToChar %>% 
#   read_html %>%
#   html_nodes("table") %>% 
#   html_table()