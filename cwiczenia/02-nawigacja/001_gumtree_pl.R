require(rvest)

link <- 'https://www.gumtree.pl/s-mieszkania-i-domy-sprzedam-i-kupie/krakow/v1c9073l3200208p1'
s <- html_session(link)

# Q1: Pobierz linki do ogłoszeń na pierwszej stronie
# Q2: Pobierz linki do ogłoszeń na pierwszych trzech stronach
# Q3: Pobierz numer ostatniej strony
# Q4: Napisz algorytm pobierający linki ze wszystkich stron








































###

require(magrittr)
require(stringi)

# Q1
s %>% 
  html_nodes(xpath = "//div[@class='view']//div[@class='title']//a") %>% 
  html_attr("href") %>%
  paste0("https://www.gumtree.pl", .)

s %>% 
  html_nodes(".title a") %>% 
  .[-(1:3)] %>% 
  html_attr("href") %>%
  paste0("https://www.gumtree.pl", .)

s %>% 
  html_nodes("div[class='view'] div.title a") %>% 
  html_attr("href") %>%
  paste0("https://www.gumtree.pl", .)

# Q2 - parametryzacja adresu

link.param <- function(pg) {
  paste0('https://www.gumtree.pl/s-mieszkania-i-domy-sprzedam-i-kupie/krakow/v1c9073l3200208p', pg)
}

getAdsLinks <- function(link) {
  html_session(link) %>%
    html_nodes("div[class='view'] div.title a") %>% 
    html_attr("href") %>%
    paste0("https://www.gumtree.pl", .)
}

adsLinks1 <- vector()
for (i in seq_along(1:3))
  adsLinks1 <- c(adsLinks1, getAdsLinks(link.param(i)))

# Q2 - kliknij "następny"

s.tmp <- s

adsLinks2 <- vector()
for (i in seq_along(1:3)) {
  adsLinks2 <- s.tmp %>%
    html_nodes("div[class='view'] div.title a") %>% 
    html_attr("href") %>%
    paste0("https://www.gumtree.pl", .) %>%
    c(adsLinks2, .)
  
  s.tmp %<>% follow_link(css = "a.next")
}

# Q3 - kliknij na numer kolejnej strony

s.tmp <- s

adsLinks3 <- vector()
for (i in seq_along(1:3)) {
  adsLinks3 <- s.tmp %>%
    html_nodes("div[class='view'] div.title a") %>% 
    html_attr("href") %>%
    paste0("https://www.gumtree.pl", .) %>%
    c(adsLinks3, .)
  
  s.tmp %<>% follow_link(css = ".after > a:nth-child(1)")
}

# Q3
s %>% 
  html_nodes(xpath = "//a[@class = 'last follows']") %>%
  html_attr("href") %>%
  stringi::stri_extract_first_regex("(?<=page-)[0-9]+") %>%
  as.numeric

# Q4
s.tmp <- s

adsLinks <- vector()
repeat{
  adsLinks <- s.tmp %>%
    html_nodes("div[class='view'] div.title a") %>% 
    html_attr("href") %>%
    paste0("https://www.gumtree.pl", .) %>%
    c(adsLinks, .)
  
  e <- try(s.tmp %<>% follow_link(css = "a.next"))
  
  if(class(e) == "try-error"){
    break
  }
}
