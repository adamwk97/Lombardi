library(tm)
#Clean data after Twitter data has been placed into a dataframe using the 'text' column

#Create a corpus of the text data
dfcorpus = Corpus(VectorSource(df$text))

#Clean the data by transforming it to lower case, removing punctuation, numbers, white space,
#URLs, and stopwords
dfcorpus = tm_map(dfcorpus,content_transformer(tolower))
dfcorpus = tm_map(dfcorpus, removePunctuation)
dfcorpus = tm_map(dfcorpus, removeNumbers)
dfcorpus = tm_map(dfcorpus, stripWhitespace)
dfcorpus <- tm_map(dfcorpus, function(x)removeWords(x,stopwords(c())))
dfcorpus = tm_map(dfcorpus, removeWords, c(stopwords("english"),"can","just","virginamerica", "'s", "'m", "--", "...", "-"))
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
dfcorpus <- tm_map(dfcorpus, content_transformer(removeURL))

#Create a new Term Document Matrix and then a new data frame of the words and the word frequencies.
dftdm = TermDocumentMatrix(dfcorpus)
matrix = as.matrix(dftdm)
words = sort(rowSums(matrix),decreasing=TRUE) 
words = sort(words, decreasing = TRUE)
dfnew = data.frame(word = names(words),freq=words)

