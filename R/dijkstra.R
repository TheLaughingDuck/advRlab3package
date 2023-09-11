#' Dijkstra's algorithm
#'
#' @param graph A data.frame with variables v1, v2, w containing numeric elements.
#' @param init_node A numeric element.
#'
#' @return A numeric vector.
#' @export
#'
#' @examples
#' graph <- data.frame(v1=c(...), v2=c(...), w=c(...))
#' dijkstra(graph, 2)
dijkstra <- function(graph, init_node){
  # This function does ...

  # ---V--- CHECK INPUT ---V---
  # Check graph argument
  stopifnot("argument \"graph\" is not data.frame." = is.data.frame(graph))
  if(length(graph) != 3)
    stop("Incorrect number of columns in graph argument.")
  if(!all(c("v1", "v2", "w") %in% colnames(graph)))
    stop("Incorrect columns/column-names in graph argument.")

  # Check init_node argument
  stopifnot("argument \"init_node\" is not numeric" = is.numeric(init_node))
  # some kind of check that init_node exists inside graph
  # ---^--- CHECK INPUT ---^---


  # THE DIJKSTRA ALGORITHM

  # ---V--- SETUP DIJKSTRA ---V---

  # get the unique node-names
  node_names <- unique(c(graph$v1, graph$v2))

  nodes <- data.frame(name = node_names,
                      visited = rep(FALSE, length(node_names)),
                      tenta_dist = rep(Inf, length(node_names)))

  # Set the initial nodes tentative distance to 0
  nodes[which(nodes$name == init_node),"tenta_dist"] <- 0

  # ---^--- SETUP DIJKSTRA ---^---



  # ---V--- DIJKSTRA LOOP ---V---

  current_node <- init_node
  while(!all(nodes$visited) & TRUE){#add the other stop condition(s)

    # find neighbours of current node (ALSO MUST BE UNVISITED)
    all_neigbours <- graph[graph[,1] == current_node,]$v2 #vector
    unvisited_neighbours <- nodes[(nodes$name %in% all_neigbours) & (nodes$visited == FALSE),]$name

    for(neighbour in unvisited_neighbours){ #c(2,3,4,5)
      # update tenta dist
      A <- nodes[which(nodes$name == current_node), "tenta_dist"] # Tent dist of current node
      B <- graph[graph[,1] == current_node & graph[,2] == neighbour,]$w # Weight of going from current node to this neighbour

      # assign to each neighbour the smaller distance of
      # (their old tent) and (the new tent)
      new_tent_dist <- min(nodes[which(nodes$name == neighbour),"tenta_dist"], A+B)
      nodes[which(nodes$name == neighbour),"tenta_dist"] <- new_tent_dist
    }
    # Mark the current node as visited
    #print(paste("marking", current_node, "as visited"))
    nodes[which(nodes$name == current_node),]$visited <- TRUE

    # select new current node: the unvisited node with smallest tentative dist.
    # sort by tenta_dist, get firt row, get name of that row.
    #current_node <- arrange(nodes, tenta_dist)[1,]$name

    if(nrow(nodes |> filter(visited == FALSE)) == 0){break}

    # Filter out visited nodes, sort them by lowest tentative dist, extract col 1, and then
    current_node <- nodes |> filter(visited == FALSE) |> arrange(tenta_dist) |> extract2(1) |> extract2(1)
    #print(paste("making", current_node, "the current node"))
  }

  # ---^--- DIJKSTRA LOOP ---^---

  return(nodes)
}

# Should be moved somewhere else?
library(magrittr)
