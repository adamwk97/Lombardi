\name{union}
\alias{union}
\title{
%%  Combines two iGraph objects
}
\description{
%%  Takes two adjacency matrices to form two independent graphs and graph layouts and then combines them into one picture.
}
\usage{
union(x)
}
\arguments{
  \item{x}{
}
}
\value{
%%  Value returned are two iGraph objects
}
\references{
%% Referenced packages: iGraph
}
\author{
%%  Adam Kelly
}
\note{
%%  USF Student
}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
%%     #Find the number of outliers
outliers = boxplot(dfnew$freq, plot = FALSE)$out
length = 30
length3 = length*3

%% Create a dataframe with number of rows equal to number of outliers.
df = dfnew[1:30,]

%% Append a column to serve as the direction of each word(vertex) and rearrange the columns.
df$from = c(1:30)
df$to = c(2:30, 1)
df = df[, c("from", "to", "word", "freq")]
df2 = df[, c("from", "word", "freq")]

%% Create an iGraph graph object from the dataframe.
g1 = graph_from_data_frame(d=df, vertices = df2, directed=FALSE) 

%% Create another iGraph graph object from the remaining rows in the dataframe. Again, I chose 
%% an abitrary 90 because I am still working on reducing the total amount of rows/outliers.
df3 = dfnew[31:90,]
df3$from = c(31:90)
df3$to = c(32:90, 31)

df3 = df3[, c("from", "to", "word", "freq")]
df4 = df3[, c("from", "word", "freq")]

g2 = graph_from_data_frame(d=df3, vertices = df4, directed=FALSE) 

%% Example end result. 
plot(g2, main = "Lombardi Graph", 
                 frame = TRUE, 
                 edge.arrow.size=.5, 
                 vertex.color = "salmon", 
                 vertex.label=df3$word, 
                 vertex.label.color="black", 
                 vertex.size = 7, 
                 vertex.label.font  = 2, 
                 edge.curved = .3, 
                 edge.width=2, 
                 layout = l
                 )
plot(g1, 
                 main = "Lombardi Graph", 
                 frame = TRUE, 
                 edge.arrow.size=.5, 
                 vertex.color = "green", 
                 vertex.label=df$word, 
                 vertex.label.color="darkgreen", 
                 vertex.label.font = 2, 
                 vertex.label.dist = 1, 
                 vertex.label.cex = 1.5, 
                 vertex.size = 9, 
                 edge.curved = .5, 
                 edge.width=2, 
                 add = TRUE)