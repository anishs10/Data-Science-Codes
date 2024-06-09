# KNN

# Set working directory (adjust the path as needed)
setwd("C:\\Users\\10ani\\Downloads\\fwdshadatascienceproject")

# Read the CSV file
prostate_cancer <- read.csv("Prostate_Cancer.csv")

# Remove the 'id' column
prostate_cancer$id <- NULL

# Check the structure of the dataset
str(prostate_cancer)

# Check the distribution of the diagnosis results
table(prostate_cancer$diagnosis_result)

# Function to normalize the data
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Normalize the relevant columns
pros_cac <- data.frame(lapply(prostate_cancer[, 2:9], normalize))

# Combine the diagnosis result with the normalized data
prostate_cac <- cbind(diagnosis_result = prostate_cancer$diagnosis_result, pros_cac)

# Check the column names
colnames(prostate_cac)

# Rename the first column to 'diag'
colnames(prostate_cac)[1] <- "diag"

# Sample indices for training set (80% of the data)
set.seed(123)  # For reproducibility
ind <- sample(seq_len(nrow(prostate_cac)), size = 0.8 * nrow(prostate_cac))

# Create training and test sets
train <- prostate_cac[ind, ]
test <- prostate_cac[-ind, ]

# Install the 'class' package if not already installed (uncomment if needed)
# install.packages("class")

# Load the 'class' package
library(class)

# Apply KNN algorithm
prc_pred <- knn(train = train[, -1], test = test[, -1], cl = train$diag, k = 5)

# View the predictions
View(prc_pred)

# Print the predictions
print(prc_pred)

# Create a confusion matrix
tbl <- table(test$diag, prc_pred)

# Calculate the accuracy
accuracy <- sum(diag(tbl)) / sum(tbl)
print(accuracy)
