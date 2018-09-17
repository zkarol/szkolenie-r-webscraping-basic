require(rvest)

# Pamiętaj o opóźnieniu

for (i in 1:20) {
  s <- html_session("https://terminyleczenia.nfz.gov.pl/?search=true&Case=1&ServiceName=ENDOPROTEZOPLASTYKA+STAWU+BIODROWEGO&State=01&Locality=&Provider=&Place=&Street=")
  # if (length(html_nodes(s, "#queues .fullWidth")) == 0) {
  #   break
  # }
  print(s$response$url)
}

