library(rvest)

link <- 'https://terminyleczenia.nfz.gov.pl/'
s <- html_session(link)

# Q1: Czy można w szybki sposób pobrać te dane?