# Wczytaj poniższe linki:

link1 <- 'http://www.filmweb.pl/Forrest.Gump'
link2 <- 'http://www.filmweb.pl/Forest.Gump'   # nazwa filmu z literówką
link3 <- 'http://www.filmwweb.pl/Forrest.Gump' # podwójne w
link4 <- 'http://www.fillmweb.pl/Forrest.Gump' # podwójne l
link5 <- 'http://www.filmwebb.pl/Forrest.Gump' # podwójne b

# Q1: Jaka jest różnica pomiędzy statusami?
# Q2: Porównaj czas działania funkcji read_html, html_session, HEAD, GET



    






























    
    



###

require(rvest)
require(httr)
# devtools::install_github("eddelbuettel/rbenchmark")
require(rbenchmark)

# Q1
html_session(link1)
html_session(link2) # uwzględnione literówki
html_session(link3) # niepoprawny adres na stronie
html_session(link4) # przekierowanie
html_session(link5) # brak domeny

# Q2 - łopatologicznie
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

# Q2 - pakietem
benchmark("read_html" = {
            read_html(link1)
          },
          "html_session" = {
            html_session(link1)
          },
          "HEAD" = {
            HEAD(link1)
          },
          "GET" = {
            GET(link1)
          },
          replications = 10,
          columns = c("test", "replications", "elapsed",
                      "relative", "user.self", "sys.self"))
