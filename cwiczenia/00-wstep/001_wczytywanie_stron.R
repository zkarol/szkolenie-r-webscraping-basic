library(httr)
library(rvest)

#EX: Wczytaj strony:

link1 <- 'http://www.filmweb.pl/Forrest.Gump'
link2 <- 'http://www.filmweb.pl/Forest.Gump'
link3 <- 'http://www.ffilmwebb.pl/Forrest.Gump'
link4 <- 'http://www.ffilmweb.pl/Forrest.Gump'

#Q1: Jaka jest roznica pomiedzy statusem link2 i link3
#Q2: Jaka jest roznica pomiedzy statusem link3 i link4
#Q3: Porównaj czas działania funkcji read_html, htrml_session oraz HEAD dla adresu link1



    






























    
    
###
###
###

#Q1, Q2
html_session(link1)
html_session(link2)
html_session(link3)
html_session(link4)

#Q3
starttime <- Sys.time()
tmp <- lapply(rep(link1, 10), read_html)
stoptime <- Sys.time()
t_read <- stoptime - starttime

starttime <- Sys.time()
tmp <- lapply(rep(link1, 10), html_session)
stoptime <- Sys.time()
t_session <- stoptime - starttime

starttime <- Sys.time()
tmp <- lapply(rep(link1, 10), HEAD)
stoptime <- Sys.time()
t_head <- stoptime - starttime

(c(t_read, t_session, t_head) %>% as.numeric) / as.numeric(t_head)
