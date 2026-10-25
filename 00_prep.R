# Bond Regression Analysis
# 00_prep.R
#
# Purpose:
# Load and clean raw datasets used for the analysis.
#
# Data:
# Proprietary Bond Data omitted from this repository. raw_data_table_1 contains information about each senior-secured bond. 
# raw_data_table_2 contains information about each company that issued the bonds. 
#
# Author: George Kobrossy
  
  
library(tidyverse)


# Loading and Cleaning Data Table 1 ---------------------------------------

raw_data_table_1 <- readxl::read_excel("data/raw_data_1a.xlsx", skip = 3)
cleaned_sp_data_1 <- raw_data_table_1|> 
  # remove empty columns and rows
  select(-`...2`) |> 
  janitor::clean_names() |> 
  filter(!is.na(issue_symbol)) |> 
  select(-type) |> 
  # add `year_matured` and categorical `time_to_maturity`
  mutate(
    year_matured = as.numeric(str_extract(issue_name, "\\d{4}$")),
    time_to_maturity = cut(
      years_to_maturity, 
      breaks = c(-Inf, 3, 10, Inf), 
      labels = c("short", "medium", "long")
    ),
    updated_ticker = str_remove(ticker_parent, "-US$")
  ) 


# Loading and Cleaning Data Table 2 ---------------------------------------

cleaned_data_2 <- readxl::read_excel("data/raw_data_2a.xlsx", skip = 3) |> 
  janitor::clean_names() |> 
  filter(!is.na(symbol))


# Joining the 2 Data Tables and Creating the Final Dataset ----------------

cleaned_data_final <- cleaned_sp_data_1 |> 
  left_join(cleaned_data_2, by = c("updated_ticker" = "symbol")) |> 
  drop_na() |> 
  rename("ebitda_margin" = "fe_val_ebitda_margin_mean_fy1_roll") |> 
  select(
    c(-cusip, -ticker_parent, -cusip_parent, -stock_exchange, -name, -closing_price)
  )


# Exporting as .csv -------------------------------------------------------

cleaned_data_final |> 
  write_csv(file = "data/Cleaned_Bond_Data_Final.csv")




