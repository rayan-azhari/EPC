# Load libraries
library(tidyverse)
library(data.table)


## Data load

# Path to where the files live
dataDir <- here::here("row_data", "all-non-domestic-certificates")

# Name of the file to import - EPC Certificate
fileName1 <- "certificates.csv"

# Name of the file to import - EPC recommendations
fileName2 <- "recommendations.csv"

# Get a list of the folder names that contains the CSVs to import
folderNames <- list.files(
  path = dataDir,
  pattern = NULL,
  all.files = FALSE,
  full.names = FALSE,
  recursive = FALSE
)

# Create a list of paths to the CSVs to import - EPC Certificate
fileList1 <-
  paste(dataDir,
        folderNames,
        fileName1,
        sep = "/")

# Create a list of paths to the CSVs to import - EPC recommendations
fileList2 <-
  paste(dataDir,
        folderNames,
        fileName2,
        sep = "/")

# For data.table, we use rbindlist() for row binding instead of do.call(rbind, ...) and fread() for reading. This is much faster than readr

# EPC Certificate Data
start_time <- Sys.time()
epcData <- data.table::rbindlist(lapply(fileList1,
                                        data.table::fread,
                                        showProgress = TRUE)) %>% as_tibble()
end_time <- Sys.time()
end_time - start_time



# EPC recommendations Data
start_time <- Sys.time()
epcRecom <- data.table::rbindlist(lapply(fileList2,
                                         data.table::fread,
                                         showProgress = TRUE)) %>% as_tibble()
end_time <- Sys.time()
end_time - start_time
