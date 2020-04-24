\name{initial_data}
\alias{initial_data}

\title{
%%  Scrape Twitter data
}
\description{
%%  Scraped data from a Twitter account and converts it into a dataframe.
}
\usage{
initial_data(x)
}
\arguments{
  \item{x}{
%%     df = userTimeline("BarackObama", n =1000)
%%     df = twListToDF(df)
}
}

\value{
%% Value returned is a dataframe
}
\references{
%% Ref packages: "twitteR"
}
\author{
%%  Adam kelly
}
\note{
%%  USF Student
}


\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
df <- userTimeline("BarackObama", n =1000)
df = twListToDF(df)
head(df)
