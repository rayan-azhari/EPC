# Load libraries
library(tidyverse)



# File Names and URLs --------------------------------------------------------------------


df <-
  as.data.frame(list(file = c("LDD - Housing Approvals unit level archive.zip",
                              "LDD - Housing Completions unit level.xlsx",
                              "LDD planning permissions.xlsx",
                              "LDD Scheme level - Non-residential floorspace.xlsx",
                              "LDD Scheme level - Non-residential bedrooms.xlsx",
                              "LDD - Housing Approvals (unit level).xlsx "), 
                     url = c("https://data.london.gov.uk/download/planning-permissions-on-the-london-development-database--ldd-/9beb52ab-fa6f-43c3-95a5-6e03ec9457e4/LDD%20-%20Housing%20Approvals%20for%20Datastore.zip",
                             "https://data.london.gov.uk/download/planning-permissions-on-the-london-development-database--ldd-/966b9309-3969-417e-b1d0-b97cfe42404a/LDD%20-%20Housing%20Completions%20unit%20level%20%28final%29.xlsx",
                             "https://data.london.gov.uk/download/planning-permissions-on-the-london-development-database--ldd-/eb050c40-3e94-4384-8e59-1b8c49dbdf36/LDD%20Permissions%20for%20Datastore%20final.xlsx",
                             "https://data.london.gov.uk/download/planning-permissions-on-the-london-development-database--ldd-/be41e8e9-6005-4623-aa71-e8a160c89b81/LDD%20Permissions%20for%20Datastore%20-%20Non-residential%20floorspace%20final.xlsx",
                             "https://data.london.gov.uk/download/planning-permissions-on-the-london-development-database--ldd-/b4faa4e6-2d91-4aba-8403-5b6c2739cec4/LDD%20Permissions%20for%20Datastore%20-%20Non-residential%20bedrooms%20final.xlsx",
                             "https://data.london.gov.uk/download/planning-permissions-on-the-london-development-database--ldd-/4d65e64c-f8d8-4ca8-90cf-97921830cec2/LDD%20-%20Housing%20Approvals%20unit%20level.xlsx")))







# Folder to save downladed files  -------------------------------------------------------------------

# Folder name
folderDir <- here::here("raw_data", "Development Database (LDD)")






# Downloads ---------------------------------------------------------------

for (row in 1:nrow(df)) {
  
  url <- df[row, "url"]
  file <- df[row, "file"]
  
  download.file(url, paste(folderDir, file, sep = "/"), quiet= FALSE, mode="wb")
  print(paste("Row ", row, "-", file, "download completed!", sep = " "))
  
}





