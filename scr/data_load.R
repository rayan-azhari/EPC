# Load libraries
library(tidyverse)
library(data.table)


# Source code -------------------------------------------------------------

# load functions by sourcing script files
source(here::here("scr", "def_functions.R"))

# load functions by sourcing script files
source(here::here("scr", "connect_to_sql_db.R"))

# When having issues with memory capacity 
# if(.Platform$OS.type == "windows") withAutoprint({
#   memory.size()
#   memory.size(TRUE)
#   memory.limit()
# })



# Non-Domestic EPC -----------------------------------------------------

# Load non-domestic EPC certificate and recommendations
nd_epc_cert <- load_certficates("all-non-domestic-certificates")

#Write nd_epc_cert to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "EPC", table   = "nd_epc_cert"),
  value = nd_epc_cert,
  # dataframe to write to DB
  append = FALSE,
  row.names = FALSE
)

rm(nd_epc_cert)


nd_epc_recom <-
  load_recommendations("all-non-domestic-certificates")

#Write nd_epc_recom to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "EPC", table   = "nd_epc_recom"),
  value = nd_epc_recom,
  # dataframe to write to DB
  append = FALSE,
  row.names = FALSE
)

rm(nd_epc_recom)



# Domestic EPC ------------------------------------------------------------
#### Split p3 into 2 folders. R is running out of memory 
# Load domestic EPC certificate and recommendations
n_epc_cert <- load_certficates("all-domestic-certificates_p3")
gc()

#Write n_epc_cert to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "EPC", table   = "n_epc_cert"),
  value = n_epc_cert,
  # dataframe to write to DB
  append = TRUE,
  row.names = FALSE
)

rm(n_epc_cert)


n_epc_recom <- load_recommendations("all-domestic-certificates")

#Write n_epc_recom to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "EPC", table   = "n_epc_recom"),
  value = n_epc_recom,
  # dataframe to write to DB
  append = FALSE,
  row.names = FALSE
)

rm(nd_epc_recom)



# DEC ---------------------------------------------------------------------

# Load DEC certificate and recommendations
dec_cert <- load_certficates("all-display-certificates")

#Write dec_cert to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "DEC", table   = "dec_cert"),
  value = dec_cert,
  # dataframe to write to DB
  append = FALSE,
  row.names = FALSE
)

rm(dec_cert)


# Load DEC certificate and recommendations
dec_recom <- load_recommendations("all-display-certificates")

#Write dec_recom to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "DEC", table   = "dec_recom"),
  value = dec_recom,
  # dataframe to write to DB
  append = FALSE,
  row.names = FALSE
)

rm(dec_recom)




# LDD ---------------------------------------------------------------------

filesLDD <- load_LDD_fileNames("Development Database (LDD)")

### Need to work of cleaning the xlsx files to be imported - this code will only import the csv file 

for (row in 1:nrow(filesLDD)) {
  # Folder name
  # folderDir <- here::here("raw_data", "Development Database (LDD)")
  fName <- filesLDD[row, "fileNames"]
  fPath <- filesLDD[row, "filePath"]
  fext <- filesLDD[row, "ext"]
  
  # if the file is .ZIP is will be unzipped.
  if (fext== "csv") {
    csv <- data.table::fread(file = fPath)
    print(paste("File ", row, 
                " was loaded and saved as -", 
                fName, 
                "- Task Completed!", 
                sep = " "), )
    
    #Write dec_recom to the database
    dbWriteTable(
      con,
      DBI::Id(schema  = "LDD", table= fName),
      value = csv,
      # dataframe to write to DB
      append = FALSE,
      overwrite= TRUE,
      row.names = FALSE
    )
    print(paste("File", fName, "was loaded to DB", sep = " "))
    
  } else if (fext== "xlsx") {
    
    xlsx <- readxl::read_excel(path= fPath, sheet = 2)
    return(xlsx)
    
    print(paste("File ", 
                row, 
                "was loaded and saved as -", 
                fName, 
                "- Task Completed!", sep = " "))
    
    #Write dec_recom to the database
    dbWriteTable(
      con,
      DBI::Id(schema  = "LDD", table= fName),
      value = xlsx,
      # dataframe to write to DB
      append = FALSE,
      row.names = FALSE
    )
    print(paste("File", fName, "was loaded to DB", sep = " "))
    
  } else {
    print("File extension must be csv or xlsx")
  }
  
}


