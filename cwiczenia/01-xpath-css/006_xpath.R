# https://www.w3schools.com/xml/xpath_syntax.asp

library(rvest)

#EX: Wczytaj stronę:

link <- 'https://www.gumtree.pl/s-mieszkania-i-domy-sprzedam-i-kupie/krakow/v1c9073l3200208p1'

s <- html_session(link)

#Q1: Pobierz tytuły ogłoszeń 






































###
###
###

#Q1
s %>% html_nodes(".title > a.href-link") %>% html_text

s %>% html_nodes(xpath = "//div[contains(@class,'view')]/ul/li//a") %>% html_text

s %>% html_nodes(xpath = "//div[@class='view']/ul/li//a") %>% html_text

s %>% html_nodes("div[class='view'] .title > a.href-link") %>% html_text
