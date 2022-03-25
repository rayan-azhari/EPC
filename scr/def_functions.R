




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




# Define function to load certificate data, input is the name of the main data folder inside the raw_data folder
load_certficates <- function(folder ) {
  
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect 
  rawData <- "raw_data"
  folderDir <- here::here(rawData, folder)
  
  # Name of the file to import - EPC Certificate
  certificate <- "certificates.csv"
  
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
          certificate,
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
load_recommendations <- function(folder ) {
  
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect 
  rawData <- "raw_data"
  folderDir <- here::here(rawData, folder)
  
  # Name of the file to import - EPC recommendations
  recommendations <- "recommendations.csv"
  
  
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
          recommendations,
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





folder <- "Development Database (LDD)"



# Define function to load  recommendations data, input is the name of the main data folder inside the raw_data folder
load_LDD_fileNames <- function(folder) {
  # Path to where the files live
  # This assumes the raw data files live in a folder called "raw_data", please change if incorrect
  rawData <- "raw_data"
  folderDir <- here::here(rawData, folder)
  
  # Get a list of the file names to import
  fileNames <- list.files(
    path = folderDir,
    pattern = NULL,
    all.files = FALSE,
    full.names = FALSE,
    recursive = FALSE
  )
  
  # Create a list of paths to the CSVs to import -  recommendations
  fileList <-
    paste(folderDir,
          fileNames,
          sep = "/")
  
  # Create dataframe with all files to load
  dfNames <- as.data.frame(fileNames) %>%
    mutate(
      ext = file_ext(fileNames),
      fileNames = str_trim(fileNames),
      fileNames = janitor::make_clean_names(fileNames),
      filePath = fileList
    )
  print("A dataframe of files to load was created")
    return(dfNames)

}

























