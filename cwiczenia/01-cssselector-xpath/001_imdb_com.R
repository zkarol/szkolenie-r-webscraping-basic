require(rvest)

link <- 'http://www.imdb.com/title/tt0109830/'
s <- html_session(link)

# Q1: Pobierz informacje o ratingu filmu
# Q2: Pobierz informacje o gatunku filmu
# Q3: Pobierz adres obrazka
# Q4: Pobierz informacje z tabeli z obsadą








































###

require(magrittr)
require(stringi)

# Q1
s %>% html_nodes(".ratingValue > strong:nth-child(1) > span:nth-child(1)") %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

s %>% html_nodes(".ratingValue > strong") %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

s %>% html_nodes("strong > span") %>% 
  html_text(trim = TRUE) %>% 
  as.numeric

# Q2
s %>% html_nodes("div.see-more:nth-child(10) > a:nth-child(2)") %>% html_text(trim = TRUE)
s %>% html_nodes("div.see-more:nth-child(10) > a:nth-child(4)") %>% html_text(trim = TRUE)

s %>% html_nodes(".see-more") %>% 
  .[stri_detect_fixed(html_text(.), "Genres:")] %>%
  html_nodes("a") %>%
  html_text(trim = TRUE)

s %>% html_nodes('.see-more:contains("Genres:")') %>%
  html_nodes("a") %>%
  html_text(trim = TRUE)

# Q3
s2 <- s %>% html_nodes(".poster > a:nth-child(1) > img:nth-child(1)") 
s2 %>% html_attr("src")
s2 %>% html_attrs %>% extract2(1) %>% extract2("src")
s2 %>% html_attrs %>% lapply(extract2, "src") %>% extract2(1)

### UWAGA !!!

s %>% html_nodes(".poster > img") %>% html_attr("src") #dlaczego puste?
s %>% html_nodes(".poster img") %>% html_attr("src")

# Q4
s %>% 
  html_nodes(".cast_list") %>% 
  html_table %>% 
  extract2(1) %>% 
  .[-1, c(2,4)]
  