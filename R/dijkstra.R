


dijkstra <- function(graph, init_node){
  # This function does ...

  # Check graph argument
  stopifnot("argument \"graph\" is not data.frame." = is.data.frame(graph))
  if(length(graph) != 3)
    stop("Incorrect number of columns in graph argument.")
  if(!all(c("v1", "v2", "w") %in% colnames(graph)))
    stop("Incorrect columns/column-names in graph argument.")

  # Check init_node argument
  stopifnot("argument \"init_node\" is not numeric" = is.numeric(init_node))
  # some kind of check that init_node exists inside graph

  # Implement the algorithm (the easy part)

  return()
}

# TESTING
#dijkstra(data.frame(v1=c(1,4,5), v2=c(7,8,0), w=c(1,2,3)), "input")
