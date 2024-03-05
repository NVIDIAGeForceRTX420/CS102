library(lubridate)
# A. Load the built-in warpbreaks

# 1. Find out, in a single command which columns of warpbreaks are either numeric or integer.
warpbreaks
numintcols <- names(warpbreaks)[sapply(warpbreaks, function(col) is.numeric(col) || is.integer(col))]

# 2. Is numeric a natural data type for the columns which are stored as such? Convert to integer when necessary. (Yes numeric is a natural data type)
new_warp <- as.integer(warpbreaks$breaks)

# 3. Error messages in R sometimes report the underlying type of object rather than the user-level class. 
as.character.condition(new_warp)

# Load the exampleFile.txt
exFile <- readLines("exampleFile.txt")
# Separate the vector of lines into comments and data
comments <- exFile[startsWith(exFile, "//")]
LineDATA <- exFile[!startsWith(exFile, "//")]

# Extract the date from the first comment line
LineDATE  <- comments[1]
date <- sub("// Survey data. Created : ", "", LineDATE )

# Read the data into a matrix
# Split the character vectors in the vector containing data lines by semicolon (;) using strsplit
split_data <- strsplit(LineDATA, ";")

# Find the maximum number of fields retrieved by split. Append rows that are shorter with NA's
FieldsMAX <- max(sapply(split_data, length))
RetrievedDATA <- lapply(split_data, function(x) c(x, rep(NA, FieldsMAX - length(x))))

# Use unlist and matrix to transform the data to row-column format
CombinedDATA <- matrix(unlist(RetrievedDATA), nrow = length(RetrievedDATA), byrow = TRUE)

# From comment lines 2-4, extract the names of the fields. Set these as colnames for the matrix
field_names_lines <- comments[2:4]
field_names <- gsub("^// Field [0-9]+: ", "", field_names_lines)
colnames(CombinedDATA) <- strsplit(field_names, ";")[[1]]

# View the CombinedDATA
View(CombinedDATA)

# Print the results
print(date)
print(CombinedDATA)

write.csv(CombinedDATA, "CombinedDATA.csv")



