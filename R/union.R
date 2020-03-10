#Install necessary Packages

packages <- c('igraph', 'readr','ggraph','MetamapsDB', 'plotrix')
for(p in packages){
  if(!require(p,character.only = TRUE)) install.packages(p, dependencies = TRUE)
  suppressMessages(library(p,character.only = TRUE))
}

#import data
net_nodes = read_csv("https://www.dropbox.com/s/ieaoo7efx87etyk/Dataset1-Media-Example-NODES.csv?dl=1")
net_edges = read.csv("https://www.dropbox.com/s/s4mli5l6j30gc5n/Dataset1-Media-Example-EDGES.csv?dl=1")
head(net_nodes)
head(net_edges)
#Create an adjacency matrix for net_edges
net_edges_mat = as.matrix(net_edges)

#Create a graph from the data
netgraph1 = graph_from_data_frame(d=net_edges_mat, vertices=net_nodes, directed=FALSE) 

netgraph1_wo_loops = simplify(netgraph1, remove.multiple = F, remove.loops = T) 

df = net_edges$from
df1 = net_edges$to

lombardi1 = plot(netgraph1_wo_loops, 
                 main = "Time Series Plot (Media)", 
                 frame = TRUE, edge.arrow.size=.5, 
                 vertex.color = "salmon", 
                 vertex.label=net_nodes$media, 
                 vertex.label.color="black", 
                 vertex.size = 7, edge.curved = .5, edge.width=2, 
                 shape='sphere')

lombardi2 = tkplot(netgraph1_wo_loops, main = "Network Graph Ex", 
                   frame = TRUE, 
                   edge.arrow.size=.5, vertex.color = "salmon", 
                   vertex.label=net_nodes$media, 
                   vertex.label.color="black", vertex.size = 7, 
                   vertex.label.family = "Times", edge.curved = .5,)
