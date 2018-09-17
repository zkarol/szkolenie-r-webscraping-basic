require(rvest)

# link <- 'http://bitcoin.pl/kurs' # strona uległa zmianie
# s <- html_session(link)

s <- '<div class="price">
          30000 <span>zł</span>
      </div>' %>%
  read_html

# Q1: Pobierz informacje o kursie bitcoina






































###

require(stringi)

# Q1
s %>% html_nodes(".price") %>% html_text(trim = TRUE)

s %>% 
  html_nodes(".price") %>% 
  html_text(trim = TRUE) %>%
  stri_extract_first_regex("[0-9]+")