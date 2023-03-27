# Junior prmliminary analysis of ghg fluxes
# 03/27/2023
# UIC prairie 2022-data

# Load packages
library(readr)
library(tidyverse)
library(readxl)
library(openintro)


# import data into R
data_complte <- read_csv("/cloud/project/complete-data-template.csv")

# correct dataframe variables
data_complte <- read_csv("/cloud/project/complete-data-template.csv") %>%                                                                                    
  janitor::clean_names()

# See the the dataframe 
glimpse(data_complte)

# import july-fluxes
july_flux <- read_csv("data/220709_fluxes.csv")
july_22_flux <- read_csv("data/220722_fluxes.csv")

# import august fluxes
august_flux <- read_csv("data/220812_fluxes.csv")

# import september fluxes
september_02_flux <- read_csv("data/220902_fluxes.csv")
september_16_flux <- read_csv("data/220916_fluxes.csv")
september_30_flux <- read_csv("data/220930_fluxes.csv")

# import october fluxes
october_flux <- read_csv("data/221019_fluxes.csv")

# import november fluxes
november_02_flux <- read_csv("data/221102_fluxes.csv")

# merge july fluxes
july_data  <- full_join(july_22_flux, july_flux)

# merge september fluxes
september_data <- full_join(september_02_flux, september_16_flux) %>% 
  full_join(september_30_flux)

# all fluxes
all_fluxes <- full_join(july_data, august_flux) %>% 
  full_join(september_data)
all_fluxes <- full_join(all_fluxes, october_flux)
all_fluxes <- full_join(all_fluxes, november_02_flux)

# see the new dataframe
glimpse(all_fluxes)

# some data visualization 
all_fluxes %>% 
  group_by(gas) %>% 
  ggplot(aes(x = flux, y = average_temp_kelvin, color = gas))+
  geom_smooth()+
  theme()

# mean Temp
mean(all_fluxes$average_temp_kelvin)

# see the date 
all_fluxes %>% 
  select(date)




