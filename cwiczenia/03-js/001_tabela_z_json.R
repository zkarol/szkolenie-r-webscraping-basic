library(rvest)
library(jsonlite)

#EX: Wczytaj stronę:

link <- "https://www.nice.org.uk/guidance/published?type=apg,csg,cg,mpg,ph,sg,sc"

s <- html_session(link)

#Q1: Pobierz dane z tabeli
#Q2: Pobierz dane dla całej tabeli






































###
###
###

#Q1, Q2
s <- html_session('https://www.nice.org.uk/guidance/published/ajax?sEcho=2&iColumns=7&sColumns=&iDisplayStart=0&iDisplayLength=-1&mDataProp_0=ProductTitle&mDataProp_1=ReferenceNumber&mDataProp_2=ReferenceNumberSortable&mDataProp_3=FirstDateToDisplay&mDataProp_4=FirstDateToSortBy&mDataProp_5=SecondDateToDisplay&mDataProp_6=SecondDateToSortBy&sSearch=&bRegex=false&sSearch_0=&bRegex_0=false&bSearchable_0=true&sSearch_1=&bRegex_1=false&bSearchable_1=true&sSearch_2=&bRegex_2=false&bSearchable_2=true&sSearch_3=&bRegex_3=false&bSearchable_3=true&sSearch_4=&bRegex_4=false&bSearchable_4=true&sSearch_5=&bRegex_5=false&bSearchable_5=true&sSearch_6=&bRegex_6=false&bSearchable_6=true&iSortCol_0=6&sSortDir_0=desc&iSortCol_1=4&sSortDir_1=desc&iSortingCols=2&bSortable_0=true&bSortable_1=true&bSortable_2=true&bSortable_3=true&bSortable_4=true&bSortable_5=true&bSortable_6=true&Type=apg"%"2Ccsg"%"2Ccg"%"2Cmpg"%"2Cph"%"2Csg"%"2Csc&Title=&FromDate=&ToDate=&ajax=ajax', 
                  add_headers(`X-Requested-With` = "XMLHttpRequest"))
dane <- s$response$content %>% 
  rawToChar %>% 
  fromJSON %>% 
  extract2('aaData')