# Load libraries
library(tidyverse)
library(data.table)




# load functions by sourcing script files
source(here::here("scr", "def_functions.R"))


# Load non-domestic EPC certificate and recommendations
nd_epc_cert <- load_EPC_certficates("all-non-domestic-certificates")
nd_epc_recom <- load_EPC_recommendations("all-non-domestic-certificates")

# Load domestic EPC certificate and recommendations
nd_epc_cert <- load_EPC_certficates("all-domestic-certificates")
nd_epc_recom <- load_EPC_recommendations("all-domestic-certificates")



# Load DEC certificate and recommendations
dec_cert <- load_DEC_certficates("all-display-certificates")
# Load DEC certificate and recommendations
dec_recom <- load_DEC_recommendations("all-display-certificates")


