library(rvest)

#EX: Wczytaj stronę:

link <- 'http://www.scottishmedicines.org.uk/SMC_Advice/Advice_Directory/SMC_Advice_Directory'

s <- html_session(link)

#Q1: Wczytaj dane z tabeli z 10 pierwszych stron (pomyśl!)








































###
###
###

#Q1
link <- "http://www.scottishmedicines.org.uk/SMC_Advice/Advice_Directory/SMC_Advice_Directory?p=0&r=100&s=&o=&ds=Y&searchtext=Enter%20keywords:&category=&submissionType=&fromDate=From:&toDate=To:&acceptedForUseCheck=Y&acceptedForRestrictedUseCheck=Y&notRecommendedForUseCheck=Y&withdrawnCheck=Y&supersededCheck=Y"
wyniki <- html_session(link) %>%
  html_node("table") %>%
  html_table
