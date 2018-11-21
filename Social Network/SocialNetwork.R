##Social Network Analysis
library (igraph)
g <- graph(c(1,2))
plot(g)
g <-graph(c("Rab","Rak","Rak","Adi","Adi","Rab","Rab","Adi","Sho","Adi"))
plot(g,vertex.color="green",vertex.size=50,edge.color='red',edge.length=100,)
degree(g)


##Network Measures

degree(g, mode='all')
degree(g, mode='in')
degree(g, mode='out')
diameter(g, directed=F,weights=NA)
edge_density(g,loops = F)
closeness(g,mode='all',weights = NA)
betweenness(g,directed = T,weights = NA)
reciprocity(g)
edge_betweenness(g,directed = T,weights = NA)

##Read data file
data <- read.csv(file.choose(),header = T)
y <- data.frame(data$first,data$second)

##Create network
net <- graph.data.frame(y,directed = T)
V(net)
E(net)
V(net)$label <-V(net)$name
V(net)$degree <-degree(net)

##Histrogram of node degree
hist(V(net)$degree,
     col='green',
     main = 'Histogram of Node Degree',
     ylab = 'Frequency',
     xlab = 'Degree of Vertices')

##Network diagram
set.seed(222)
plot(net,
     vertex.color='green',
     vertext.siZe='2',
     edge.arrow.size=0.2,
     vertex.label.cex=-10)

##Highlites Degree

plot(net,
     vertex.color=rainbow(52),
     vertex.size= V(net)$degree*.4,
     edge.arrow.size=.4,
     layout=layout.kamada.kawai)

##Community detection
net <-graph.data.frame(y,directed = F)
cnet <-cluster_edge_betweenness(net)
plot(cnet,
     net,
     vertex.size=10,
     vertex.label.cex=.8)
