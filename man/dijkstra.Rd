% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dijkstra.R
\name{dijkstra}
\alias{dijkstra}
\title{Dijkstra's algorithm}
\source{
\href{https://en.wikipedia.org/wiki/Dijkstra\%27s_algorithm}{The wikipedia page of the Dijkstra Algorithm}
}
\usage{
dijkstra(graph, init_node)
}
\arguments{
\item{graph}{A data.frame with variables \code{v1}, \code{v2}, w containing numeric elements,
representing the edges of the graph. Arguments \code{v1} and \code{v2} specifies two nodes,
and \code{w} specifies the weight or "distance" from node \code{v1} to node \code{v2}. Note that
edges are expected to be defined both ways, e.g. \code{v1 = c(1,2)}, \code{v2 = c(2,1)}.}

\item{init_node}{A numeric indicating the initial node in the graph.}
}
\value{
A numeric vector containing the shortest distance to the respective
nodes from the initial node, sorted by node names in \emph{ascending order}.
}
\description{
\code{dijkstra()} employs the dijkstra algorithm to find the shortest path to each
node from a given starting node in a network graph.
}
