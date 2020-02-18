Lombardi
================

    ## Loading required package: igraph

    ## Warning: package 'igraph' was built under R version 3.6.2

    ## 
    ## Attaching package: 'igraph'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     decompose, spectrum

    ## The following object is masked from 'package:base':
    ## 
    ##     union

    ## Loading required package: readr

    ## Loading required package: ggraph

    ## Loading required package: ggplot2

    ## Loading required package: MetamapsDB

    ## 
    ## Attaching package: 'MetamapsDB'

    ## The following object is masked from 'package:igraph':
    ## 
    ##     connect

    ## Loading required package: plotrix

``` r
#import data

net_nodes = read_csv("https://www.dropbox.com/s/ieaoo7efx87etyk/Dataset1-Media-Example-NODES.csv?dl=1")
```

    ## Parsed with column specification:
    ## cols(
    ##   id = col_character(),
    ##   media = col_character(),
    ##   media.type = col_double(),
    ##   type.label = col_character(),
    ##   audience.size = col_double()
    ## )

``` r
net_edges = read.csv("https://www.dropbox.com/s/s4mli5l6j30gc5n/Dataset1-Media-Example-EDGES.csv?dl=1")
head(net_nodes)
```

    ## # A tibble: 6 x 5
    ##   id    media               media.type type.label audience.size
    ##   <chr> <chr>                    <dbl> <chr>              <dbl>
    ## 1 s01   NY Times                     1 Newspaper             20
    ## 2 s02   Washington Post              1 Newspaper             25
    ## 3 s03   Wall Street Journal          1 Newspaper             30
    ## 4 s04   USA Today                    1 Newspaper             32
    ## 5 s05   LA Times                     1 Newspaper             20
    ## 6 s06   New York Post                1 Newspaper             50

``` r
head(net_edges)
```

    ##   from  to weight      type
    ## 1  s01 s02     10 hyperlink
    ## 2  s01 s02     12 hyperlink
    ## 3  s01 s03     22 hyperlink
    ## 4  s01 s04     21 hyperlink
    ## 5  s04 s11     22   mention
    ## 6  s05 s15     21   mention

``` r
#Create an adjacency matrix for net_edges
net_edges_mat = as.matrix(net_edges)
```

``` r
netgraph1 = graph_from_data_frame(d=net_edges, vertices=net_nodes, directed=FALSE) 

netgraph1_wo_loops = simplify(netgraph1, remove.multiple = F, remove.loops = T) 
```

``` r
df4 = net_edges$from
df5 = net_edges$to

lombardi1 = plot(netgraph1_wo_loops, main = "Time Series Plot (Media)", frame = TRUE, edge.arrow.size=.5, vertex.color = "salmon", vertex.label=net_nodes$media, vertex.label.color="black", vertex.size = 7, edge.curved = .5, edge.width=2, shape='sphere')
lines(df4,df5, col = "red",)
```

![](graphs_files/figure-markdown_github/graph%20paramaters-1.png)

``` r
lombardi2 = tkplot(netgraph1_wo_loops, main = "Network Graph Ex", frame = TRUE, edge.arrow.size=.5, vertex.color = "salmon", vertex.label=net_nodes$media, vertex.label.color="black", vertex.size = 7, vertex.label.family = "Times", edge.curved = .5,)
```
