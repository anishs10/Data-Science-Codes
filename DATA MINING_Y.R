# Data mining

# Install necessary packages (uncomment if not already installed)
# install.packages("tm")
# install.packages("wordcloud")
# install.packages("tidyverse")
# install.packages("RColorBrewer")

# Load necessary libraries
library(tm)
library(wordcloud)
library(tidyverse)
library(RColorBrewer)

# Set working directory (adjust the path as needed)
setwd("C:\\Users\\10ani\\Downloads\\fwdshadatascienceproject")

# Read the CSV file
comments <- read.csv("comments.csv", encoding = "UTF-8")

# Function to clean text data and handle multibyte strings
clean_text <- function(text) {
  text <- iconv(text, to = "UTF-8", sub = "byte")  # Convert to UTF-8 and handle invalid characters
  text <- gsub("[^[:print:]]", "", text)  # Remove non-printable characters
  return(text)
}

# Apply the cleaning function to the 'Comments' column
comments$Comments <- sapply(comments$Comments, clean_text)

# Create a corpus from the 'Comments' column
myCorpus <- Corpus(VectorSource(comments$Comments))

# Check the class of the corpus
class(myCorpus)

# Inspect the first comment before transformation
inspect(myCorpus[[1]])

# Transformations: convert to lowercase, remove numbers, stopwords, punctuation, and whitespace
myCorpus <- tm_map(myCorpus, content_transformer(tolower))
myCorpus <- tm_map(myCorpus, removeNumbers)
myCorpus <- tm_map(myCorpus, removeWords, stopwords("english"))
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, removeWords, c("get", "took", "gave"))
myCorpus <- tm_map(myCorpus, stripWhitespace)

# Inspect the first comment after transformation
inspect(myCorpus[[1]])

# Create a Term-Document Matrix
tdm <- TermDocumentMatrix(myCorpus)

# Convert the matrix to a more workable format
mat <- as.matrix(tdm)

# Sort terms by frequency
v <- sort(rowSums(mat), decreasing = TRUE)

# Create a data frame with words and their frequencies
d <- data.frame(word = names(v), freq = v)

# Generate the word cloud
wordcloud(d$word, d$freq)

# Add title to the word cloud
title(main = "WORD CLOUD")

# Skip random order and control location and appearance of words
wordcloud(d$word, d$freq, random.order = FALSE, rot.per = 0.3, scale = c(4, 0.5), max.words = 20, colors = brewer.pal(8, "Dark2"))


