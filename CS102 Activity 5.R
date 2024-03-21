library(dplyr)
library(readr)
library(stringr)

MergedMovies_3000 <- read.csv("Merged_Movie_Reviews.csv", stringsAsFactors = FALSE)

str(MergedMovies_3000)

cleaned_data <- MergedMovies_3000 %>%
na.omit() %>%
mutate_all(str_trim)

str(cleaned_data)

write.csv(cleaned_data, "Data_Cleaned_Movies.csv", row.names = FALSE)