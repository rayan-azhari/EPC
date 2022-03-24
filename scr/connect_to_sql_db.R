# Connect tot SQL database


# Load Libraries ----
library(RPostgres)



# Creates a connection to the casa postGIS databas
con <-
  dbConnect(
    RPostgres::Postgres(),
    dbname = "BuiltEnv",
    port = 5433,
    user = "postgres",
    password = "66mxmakh*85"
  )







