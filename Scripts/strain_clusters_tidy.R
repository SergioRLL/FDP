# script to modify the orginial strain clusters table to improve its reading
library(tidyr)

table <- read.table("strain_clusters.tsv", header = TRUE)

# making one row for sample and one column for MAG
table2 <- table %>%
  spread(key = MAG, value = cluster)

write.table(table2, file = "Strain_clusters_tidy.txt", 
            append = FALSE, sep = "\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
