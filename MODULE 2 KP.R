
# Load the data manipulation package (similar to pandas)
library(dplyr)

# Load the data frame package 
library(tibble)

# Load the numerical computing package 
library(matrixStats)


# Load the readr package for reading CSV files
library(readr)

# Read the CSV file into a data frame
df <- read_csv("Salaries.csv")

# Print data types of each column
cat("Data types:\n\n")
str(df)
cat("\n")

# Print dimensions of the data frame
cat("Dimension of df:\n\n")
cat(dim(df), "\n")

# check null values
print(colSums(is.na(df)))

# Specify columns to drop
cols_to_drop <- c("Notes", "Status")

# Drop the specified columns from the data frame
df <- df[ , !(names(df) %in% cols_to_drop)]

# Verify the remaining columns
print(names(df))

# Define pay columns
pay_cols <- c("BasePay", "OvertimePay", "OtherPay", "Benefits")

# Fill NA values with 0 in those columns
df[pay_cols] <- lapply(df[pay_cols], function(x) ifelse(is.na(x), 0, x))

# Verify null values
print(colSums(is.na(df)))

# the first 5 rows of a DataFrame
head(df, 5)

# the first 10 rows of a DataFrame
head(df, 10)

#calculates the average of the TotalPay
mean(df$TotalPay, na.rm = TRUE)

# What is the highest amount of TotalPay in the dataset 
max(df$TotalPay, na.rm = TRUE)

# What is the job title of DAVID KUSHNER
df[df$EmployeeName == "DAVID KUSHNER", "JobTitle"]

# How many people have the word DIRECTOR in their job title
director_string <- function(title) {
	grepl("director", tolower(title))
}
sum(grepl("director", tolower(df$JobTitle)))

