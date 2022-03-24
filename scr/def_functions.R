




#' Scatter polt of two variables x1 and y1
#'
#' @param data Dataset to plot
#' @param x1 is the variable on x axis
#' @param y1 is the variable on y axis
#'
#' @return ggplot2 object
#' @import ggplot2
#' @export

viz_sctter <- function(data, x1, y1) {
  ggplot2::ggplot(
    data = data,
    mapping = aes(x = {{ x1 }}, y = {{ y1 }})
  ) +
    geom_point()
}




# Define function to load EPC certificate data, input is the name of the main data folder inside the raw_data folder
load_EPC_certficates <- function(EPCfolder ) {
  
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect 
  rawData <- "raw_data"
  folderDir <- here::here(rawData, EPCfolder)
  
  # Name of the file to import - EPC Certificate
  EPC_certificate <- "certificates.csv"
  
  # Get a list of the folder names that contains the CSVs to import
  folderList <- list.files(
    path = folderDir,
    pattern = NULL,
    all.files = FALSE,
    full.names = FALSE,
    recursive = FALSE
  )
  
  # Create a list of paths to the CSVs to import - EPC Certificate
  EPC_fileList <-
    paste(folderDir,
          folderList,
          EPC_certificate,
          sep = "/")
  
  # For data.table, we use rbindlist() for row binding instead of do.call(rbind, ...) and fread() for reading. This is much faster than readr
  
  # EPC Certificate Data
  startTime <- Sys.time()
  EPC_cert_data <- data.table::rbindlist(lapply(EPC_fileList,
                                                data.table::fread,
                                                showProgress = F)) %>% as_tibble()
  endTime <- Sys.time()
  print (endTime - startTime)
  return(EPC_cert_data)
  
}




# Define function to load EPC recommendations data, input is the name of the main data folder inside the raw_data folder
load_EPC_recommendations <- function(EPCfolder ) {
  
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect 
  rawData <- "raw_data"
  folderDir <- here::here(rawData, EPCfolder)
  
  # Name of the file to import - EPC recommendations
  EPC_recommendations <- "recommendations.csv"
  
  
  # Get a list of the folder names that contains the CSVs to import
  folderList <- list.files(
    path = folderDir,
    pattern = NULL,
    all.files = FALSE,
    full.names = FALSE,
    recursive = FALSE
  )
  
  # Create a list of paths to the CSVs to import - EPC recommendations
  Recom_fileList <-
    paste(folderDir,
          folderList,
          EPC_recommendations,
          sep = "/")
  
  # For data.table, we use rbindlist() for row binding instead of do.call(rbind, ...) and fread() for reading. This is much faster than readr
  
  # EPC recommendations Data
  startTime <- Sys.time()
  EPC_recom_data <- data.table::rbindlist(lapply(Recom_fileList,
                                                 data.table::fread,
                                                 showProgress = F)) %>% as_tibble()
  endTime <- Sys.time()
  print (endTime - startTime)
  return(EPC_recom_data)
  
}




# Define function to load DEC certificate data, input is the name of the main data folder inside the raw_data folder
load_DEC_certficates <- function(DECfolder ) {
  
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect 
  rawData <- "raw_data"
  #DECfolder <- "all-display-certificates"
  folderDir <- here::here(rawData, DECfolder)
  
  # Name of the file to import - DEC Certificate
  DEC_certificate <- "certificates.csv"
  
  # Get a list of the folder names that contains the CSVs to import
  folderList <- list.files(
    path = folderDir,
    pattern = NULL,
    all.files = FALSE,
    full.names = FALSE,
    recursive = FALSE
  )
  
  # Create a list of paths to the CSVs to import - DEC Certificate
  DEC_fileList <-
    paste(folderDir,
          folderList,
          DEC_certificate,
          sep = "/")
  
  # For data.table, we use rbindlist() for row binding instead of do.call(rbind, ...) and fread() for reading. This is much faster than readr
  
  # DEC Certificate Data
  startTime <- Sys.time()
  DEC_cert_data <- data.table::rbindlist(lapply(DEC_fileList,
                                                data.table::fread,
                                                showProgress = F)) %>% as_tibble()
  endTime <- Sys.time()
  print (endTime - startTime)
  return(DEC_cert_data)
  
}




# Define function to load DEC recommendations data, input is the name of the main data folder inside the raw_data folder
load_DEC_recommendations <- function(DECfolder ) {
  
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect 
  rawData <- "raw_data"
  #DECfolder <- "all-display-certificates"
  folderDir <- here::here(rawData, DECfolder)
  
  # Name of the file to import - DEC recommendations
  DEC_recommendations <- "recommendations.csv"
  
  
  # Get a list of the folder names that contains the CSVs to import
  folderList <- list.files(
    path = folderDir,
    pattern = NULL,
    all.files = FALSE,
    full.names = FALSE,
    recursive = FALSE
  )
  
  # Create a list of paths to the CSVs to import - DEC recommendations
  Recom_fileList <-
    paste(folderDir,
          folderList,
          DEC_recommendations,
          sep = "/")
  
  # For data.table, we use rbindlist() for row binding instead of do.call(rbind, ...) and fread() for reading. This is much faster than readr
  
  # DEC recommendations Data
  startTime <- Sys.time()
  DEC_recom_data <- data.table::rbindlist(lapply(Recom_fileList,
                                                 data.table::fread,
                                                 showProgress = F)) %>% as_tibble()
  endTime <- Sys.time()
  print (endTime - startTime)
  return(DEC_recom_data)
  
}
