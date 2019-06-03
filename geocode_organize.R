library(googlesheets)
library(tidyverse)
library(xlsx)

# Authenticate google
gs_auth(new_user = TRUE)

# Check available sheets
gs_ls()
available <- gs_ls()

# Read in the art extracted spreadsheet
tav <- gs_title("3_21_2019 NEW _Veteran Xtract_")
tav <- gs_read(tav)

thank <- tav
thank$geoaddress <- NA

thank <- unite(thank, geoaddress, c('Residential Address - Street Number',
                           'Residential Address - Street Name',
                           'Mailing Address - Apartment Number',
                           'Residential Address - Zip Code'),
      sep = ' ', remove = FALSE)

write.csv(thank, 'tables/tav_geordy.csv', row.names = FALSE)



