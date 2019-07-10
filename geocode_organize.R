library(googlesheets)
library(tidyverse)
library(xlsx)

# Authenticate google
gs_auth(new_user = TRUE)

# Check available sheets
#gs_ls()
#<<<<<<< HEAD
#available <- gs_ls()
#=======
#available <- gs_ls()
#>>>>>>> ce7099d2a5ab7b92a011c9f99a599f820eb1ea46

# Read in the art extracted spreadsheet
tav <- gs_title("3_21_2019 NEW _Veteran Xtract_")
tav <- gs_read(tav)

thank <- tav
thank$geoaddress <- NA

thank$`Mailing Address - Apartment Number` [ is.na(thank$`Mailing Address - Apartment Number`) ] <- ''

thank <- unite(thank, geoaddress, c('Residential Address - Street Number',
                           'Residential Address - Street Name',
                           'Residential Address - Zip Code'),
      sep = ' ', remove = FALSE)

write.csv(thank, 'tables/tav_geordy.csv', row.names = FALSE)

thank2 <- tav
thank2$geoaddress <- NA

thank2$`Mailing Address - Apartment Number` [ is.na(thank2$`Mailing Address - Apartment Number`) ] <- ''

thank2 <- unite(thank2, geoaddress, c('Residential Address - Street Number',
                                    'Residential Address - Street Name',
                                    'Residential Address - Zip Code'),
               sep = ' ', remove = FALSE)

write.csv(thank2, 'tables/tav_geordy_2.csv', row.names = FALSE)
