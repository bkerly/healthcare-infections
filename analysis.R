library(tidyverse)
library(DBI)
library(lubridate)

# Get data
con <- DBI::dbConnect(odbc::odbc(), "DPHE144")

allcases<- tbl(con, dbplyr::in_schema("cases", "covid19_cedrs"))%>%
  left_join(
    tbl(con, dbplyr::in_schema("cases", "employment")),
    by= c("profileid"="ProfileID")
    ) %>%
  head(1000) %>%
  collect()