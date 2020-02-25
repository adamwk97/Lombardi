
#Load packages and the sample dataset
library(tm)
df = read.csv("C:/Users/adamw/Documents/Data Textmining/Datasets/sample.csv")

#Clean the data by converting to a corpus and removing punctuation, numbers and white space.
dfcorpus = Corpus(VectorSource(df$text))
dfcorpus = tm_map(dfcorpus,content_transformer(tolower))
dfcorpus = tm_map(dfcorpus, removePunctuation)
dfcorpus = tm_map(dfcorpus, removeNumbers)
dfcorpus = tm_map(dfcorpus, stripWhitespace)
dfcorpus = tm_map(dfcorpus, removeWords, c(stopwords("english")))