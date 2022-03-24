# Connect tot SQL database


# Load Libraries ----


library(tidyverse)
library(here)
library(RPostgres)


# Connect to the remote database using PostgreSQL ----


con <- dbConnect(
  RPostgres::Postgres(),
  host = "128.40.150.33",
  dbname = "3DSTOCK",
  user = rstudioapi::askForPassword("Database username"),
  password = rstudioapi::askForPassword("Database password")
)


# Set Parameters  ----

# Link to the SQL query
sql_query <- here::here("ext", "NAME OF SQL.sql")


# Run the SQL query ----

# Run the SQL query using PostgreSQL which will get all office SCUs
df <- dbGetQuery(con, statement = read_file(sql_query))




filePath <- paste0(here::here("row_data"), "/", "df_", format(Sys.time(), "%d-%m-%Y"), ".rds")

write_rds(df, filePath)