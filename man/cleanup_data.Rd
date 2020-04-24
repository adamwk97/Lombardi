\name{cleanup_data}
\alias{cleanup_data}
\title{
%%  Cleanup scraped Twitter data
}
\description{
%%  Takes twitter dataframe and cleans it up by converting it to a corpus and transforming it to allow for seamless analysis. Functions include removing whitespaceses, transforming to lower case, removing special characters, punctuation and numbers.
}
\usage{
cleanup_data(x)
}
\arguments{
  \item{x}{
%%     Convert data to corpus, clean it and reassign to new dataframe.
}
}

\value{
%%  Value returned is dataframe.
}
\references{
%% Referenced packages: "tm"
}
\author{
%%  Adam Kelly
}
\note{
%%  USF Student
}

\examples{
dfcorpus = Corpus(VectorSource(df$text))

dfcorpus = tm_map(dfcorpus,content_transformer(tolower))
dfcorpus = tm_map(dfcorpus, removePunctuation)
dfcorpus = tm_map(dfcorpus, removeNumbers)
dfcorpus = tm_map(dfcorpus, stripWhitespace)
dfcorpus <- tm_map(dfcorpus, function(x)removeWords(x,stopwords(c())))
dfcorpus = tm_map(dfcorpus, removeWords, c(stopwords("english"),"can","just","virginamerica", "'s", "'m", "--", "...", "-"))
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
dfcorpus <- tm_map(dfcorpus, content_transformer(removeURL))

dftdm = TermDocumentMatrix(dfcorpus)
matrix = as.matrix(dftdm)
words = sort(rowSums(matrix),decreasing=TRUE) 
words = sort(words, decreasing = TRUE)
dfnew = data.frame(word = names(words),freq=words)
