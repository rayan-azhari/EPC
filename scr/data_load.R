# Load libraries
library(tidyverse)
library(data.table)


# Source code -------------------------------------------------------------

# load functions by sourcing script files
source(here::here("scr", "def_functions.R"))

# load functions by sourcing script files
source(here::here("scr", "connect_to_sql_db.R"))


# Non-Domestic EPC -----------------------------------------------------

# Load non-domestic EPC certificate and recommendations
nd_epc_cert <- load_EPC_certficates("all-non-domestic-certificates")

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
  load_EPC_recommendations("all-non-domestic-certificates")

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

# Load domestic EPC certificate and recommendations
n_epc_cert <- load_EPC_certficates("all-domestic-certificates")


#Write n_epc_cert to the database
dbWriteTable(
  con,
  DBI::Id(schema  = "EPC", table   = "n_epc_cert"),
  value = n_epc_cert,
  # dataframe to write to DB
  append = FALSE,
  row.names = FALSE
)

rm(n_epc_cert)


n_epc_recom <- load_EPC_recommendations("all-domestic-certificates")

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
dec_cert <- load_DEC_certficates("all-display-certificates")

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
dec_recom <- load_DEC_recommendations("all-display-certificates")

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
