library(rvest)

#EX: Wczytaj stronę:

link <- 'https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania?utm_source=analizy.pl&utm_medium=MenuButton&utm_campaign=Analizy_2015_Notowania_FI'

s <- html_session(link)

#Q1: Sparametryzuj link tak aby było możliwe pobranie zawartości całej tabeli
#Q2: Czy do pobrania calej tabeli potrzebna jest pętla?
#Q3: Pobierz zawartość tabeli






































###
###
###

#Q1
link.param <- function(pg) {
  paste0("https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--/limit/100/strona/", pg, "/sort/1/sort_dir/ASC/")
}

#Q2
# Zmień limit na 100+, -1, 0

#Q3
curr_pg <- 1
notowania <- data.frame(stringsAsFactors = FALSE)
repeat{
  notowania.tmp <- html_session(link.param(curr_pg)) %>% 
    html_node("#noteTable") %>%
    html_table(header = TRUE) %>% 
    .[,-1] %>% 
    set_colnames(.[1,]) %>% 
    .[-1,]
  
  if (nrow(notowania.tmp) == 0) {
    break
  }

  notowania <- rbind(notowania, notowania.tmp)
  curr_pg <- curr_pg + 1
}
