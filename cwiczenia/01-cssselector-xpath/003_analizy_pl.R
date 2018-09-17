require(rvest)

link <- 'https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania'
s <- html_session(link)

# Q1: Pobierz 10 pierwszych wierszy z tabeli
# Q2: Do uzyskanej tabeli dodaj kolumne z typem funduszu
# Q3: Czy jest wszystko w porządku z kolumną j.u. netto?
#     https://worksmarter.pl/post/webscraping-case-study-1/








































###

require(stringi)

# Q1
notowania <- s %>% 
  html_node("#noteTable") %>% 
  html_table(header = TRUE) %>% 
  .[,-1] %>% 
  set_colnames(.[1,]) %>% 
  .[-1,] %>% 
  head(10)

# Q2
notowania$typ <- s %>% 
  html_nodes("tr > :first-child > img") %>%
  html_attr("title") %>%
  head(10)

notowania$typ <- s %>% 
  html_nodes("tbody .segment img") %>%
  html_attr("title") %>%
  head(10)