#' Dijkstra's algorithm
#'
#' @description `dijkstra()` employs the dijkstra algorithm to find the shortest path to each
#' node from a given starting node in a network graph.
#'
#' @param graph A data.frame with variables `v1`, `v2`, w containing numeric elements,
#' representing the edges of the graph. Arguments `v1` and `v2` specifies two nodes,
#' and `w` specifies the weight or "distance" from node `v1` to node `v2`. Note that
#' edges are expected to be defined both ways, e.g. `v1 = c(1,2)`, `v2 = c(2,1)`.
#'
#' @param init_node A numeric indicating the initial node in the graph.
#'
#' @return A numeric vector containing the shortest distance to the respective
#' nodes from the initial node, sorted by node names in *ascending order*.
#'
#' @source [The wikipedia page of the Dijkstra Algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)
#'
#' @importFrom dplyr arrange filter
#' @importFrom magrittr %>% extract2
#' @importFrom rlang .data
#'
#' @export dijkstra


dijkstra <- function(graph, init_node){

  # ---V--- CHECK INPUT ---V---
  # Check graph argument
  stopifnot("argument \"graph\" is not data.frame." = is.data.frame(graph))
  if(length(graph) != 3)
    stop("Incorrect number of columns in graph argument. Expected 3 (v1, v2, w).")
  if(!all(c("v1", "v2", "w") %in% colnames(graph)))
    stop("Incorrect columns/column-names in graph argument.")

  # Check init_node argument
  stopifnot("argument \"init_node\" is not numeric" = is.numeric(init_node))
  stopifnot("init_node is not present in graph." = init_node %in% unique(c(graph$v1, graph$v2)))
  # ---^--- CHECK INPUT ---^---


  # ---V--- SETUP DIJKSTRA ---V---
  # Get the unique names of all nodes
  node_names <- unique(c(graph$v1, graph$v2))

  # Put together a dataframe containing information about all nodes
  nodes <- data.frame(name = node_names,
                      visited = rep(FALSE, length(node_names)),
                      tenta_dist = rep(Inf, length(node_names)))

  # Set the initial nodes tentative distance to 0
  nodes[which(nodes$name == init_node),"tenta_dist"] <- 0

  # Start the algorithm in the initial node
  current_node <- init_node
  # ---^--- SETUP DIJKSTRA ---^---


  # ---V--- DIJKSTRA LOOP ---V---
  repeat{#while(!all(nodes$visited)){

    # Find *unvisited* neighbours of current node
    all_neigbours <- graph[graph[,1] == current_node,]$v2
    unvisited_neighbours <- nodes[(nodes$name %in% all_neigbours) & (nodes$visited == FALSE),]$name

    # Iterate through the unvisited neighbours of the current node and update
    # their tentative distances
    for(neighbour in unvisited_neighbours){ #c(2,3,4,5)
      # Update tenta dist
      A <- nodes[which(nodes$name == current_node), "tenta_dist"] # Tent dist of current node
      B <- graph[graph[,1] == current_node & graph[,2] == neighbour,]$w # Weight of going from current node to this neighbour

      # Assign to each neighbour the smaller distance of
      # (their old tent) and (the new tent)
      new_tent_dist <- min(nodes[which(nodes$name == neighbour),"tenta_dist"], A+B)
      nodes[which(nodes$name == neighbour), "tenta_dist"] <- new_tent_dist
    }
    # Mark the current node as visited
    nodes[which(nodes$name == current_node),]$visited <- TRUE

    # Check if all nodes have been visited
    if(all(nodes$visited)){break}
    #if(nrow(nodes %>% filter(nodes$visited == FALSE)) == 0){break}
    # perhaps this while loop should be a repeat loop
    # then this line (just above) can be done more compactly, like in the while loop start.

    # Select new current node: the unvisited node with smallest tentative dist.
    # Filter out visited nodes, sort remaining by lowest tentative dist, extract
    # col 1, and then element 1.

    #return(nodes)

    current_node <- nodes %>%
      filter(nodes$visited == FALSE) %>%
      arrange(.data$tenta_dist) %>%
      extract2(1) %>%
      extract2(1)
  }
  # ---^--- DIJKSTRA LOOP ---^---


  # Put together output; the tentative distances ordered by node name
  output <- nodes %>%
    arrange(nodes$name)

  output <- output[,3]

  # output <- nodes %>%
  #   arrange(nodes$name) %>%
  #   select(tenta_dist) %>%
  #   extract2(1)

  return(output)
}
