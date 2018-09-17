# Podstawowe funkcje pakietu rvest

require(rvest)

## Ekstrakcja danych

pg <- '<div>
           <a href="www.strona.pl">nazwa strony</a>
       </div>' %>%
  read_html



pg %>% html_nodes("a") %>% html_attr("href")
pg %>% html_nodes("a") %>% html_text()
pg %>% html_nodes("a") %>% html_name()

### Nawet w przypadku korzystania z id znacznika
### należy rozważyć użycie html_nodes nad html_node

pg <- '<div>
           <a id="duplikat" href="www.strona.pl">nazwa strony</a>
           <p id="duplikat">TEST</p>
       </div>' %>%
  read_html



pg %>% html_node("#duplikat")
pg %>% html_nodes("#duplikat")

## Tabele

pg <- '<body>
           <table">
                <tr>
                    <th>Title</th>
                    <th>Rating</th>
                    <th>Types</th>
                </tr>
                <tr>
                    <td>Skazani na Shawshank</td>
                    <td>8.8</td>
                    <td>Dramat</td>
                </tr>
                <tr>
                    <td>Nietykalni</td>
                    <td>8.7</td>
                    <td>Dramat; Komedia</td>
                </tr>
           </table>
       </body>' %>%
  read_html



pg %>% html_node('table') %>% html_table

## Formularze

pg <- 'www.google.pl' %>% 
  html_session



f <- pg %>% html_nodes("form") %>% html_form %>% .[[1]]
f <- set_values(f, q = "ML@Enterprise")
wyniki <- submit_form(pg, f)

wyniki %>% html_nodes('.g h3 a') %>% html_attr("href")
wyniki %>% html_nodes('.g .s .st') %>% html_text