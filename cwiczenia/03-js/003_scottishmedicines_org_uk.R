library(rvest)

link <- 'http://www.scottishmedicines.org.uk/SMC_Advice/Advice_Directory/SMC_Advice_Directory'
s <- html_session(link)

# Q1: Wczytaj dane z kolejnych podstron











































###

require(jsonlite)

# Q1
link <- "https://www.scottishmedicines.org.uk/umbraco/Api/ListMedicineAdviceApi/GetResultsByType?active-tab=0&node-id=6990&keywords=&filter-3561=&filter-3567=&filter-3803=&from=&to=&total-results-0=1435&current-page-0=2&max-page-0=72&total-results-1=37&current-page-1=1&max-page-1=2"
s <- html_session(link)

dane <- s$response$content %>% 
  rawToChar %>% 
  fromJSON