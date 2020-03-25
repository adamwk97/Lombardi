#Load the twitteR package
library(twitteR)

#Create a dataframe of tweets based off a particular user. 
df <- userTimeline("BarackObama", n =1000)
df = twListToDF(df)
head(df)