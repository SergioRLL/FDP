# R script to create the BBMO sample attributes file

bbmo_meta <- read.table("bbmo_meta_v3.txt", header = TRUE)
library(dplyr)
a <- bbmo_meta %>%
  select(Samples, Day_length, Temperature, Salinity, season)
  
b <- a %>%
  mutate(Temp_range = ifelse(Temperature <= 17.5, "T<=17.5", 
                             ifelse(Temperature > 17.5 & Temperature <= 20.0, "17.5<T<=20", 
                                    ifelse(Temperature > 20.0 & Temperature <= 22.5, "20<T<=22.5",
                                           ifelse(Temperature > 22.5 & Temperature <= 25.0, "22.5<T<=25",
                                                  ifelse(Temperature > 25.0, "T>25", NA)))))) %>%
  select(Samples, season, Temp_range)

write.table(b, file = "SampleAttributes.txt", 
            append = FALSE, sep = "\t", row.names=FALSE, col.names=TRUE, quote=FALSE)