#context("dijkstra")

wiki_graph <-
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))

test_that("outputs are correct in the Dijkstra algorithm.", {
  expect_equal(dijkstra(wiki_graph,1), c(0,7,9,20,20,11))
  expect_equal(dijkstra(wiki_graph,3), c(9,10,0,11,11,2))
})


test_that("Error messages are returned for erronous input in the Dijkstra algorithm.", {
  wiki_wrong_graph <- wiki_graph
  names(wiki_wrong_graph) <- c("v1, v3, w")
  expect_error(dijkstra(wiki_wrong_graph, 3))
  wiki_wrong_graph <- wiki_graph[1:2]
  expect_error(dijkstra(wiki_wrong_graph, 3))
  expect_error(dijkstra(wiki_graph, 7))
  expect_error(dijkstra(as.matrix(wiki_graph), 3))
})


test_that("dijkstra() output is in correct format", {
  # Testing for correct output format

  graph <- data.frame(v1=c(1,4,5,8,9), v2=c(7,8,0,2,1), w=c(1,2,3,1,1))

  dijkstra_output <- dijkstra(graph, 4)

  comparison <- is.vector(dijkstra_output)

  expect_equal(TRUE, comparison)
})


test_that("dijkstra() correctly works for a known graph", {
  # Testing a specific graph with known distances to a specific start node

  graph <- data.frame(v1 = c(1,1,1,1,2,2,2,2,2,3,3,3,4,4,4,5,5,6,6,7,7,8,9,10,10,11),
                      v2 = c(2,3,4,5,7,3,1,5,8,6,2,1,9,10,1,1,2,3,7,6,2,2,4,4,11,10),
                      w = rep(1,26))

  dijkstra_output <- dijkstra(graph, 1)

  #expected_output <- data.frame(name=1:11, visited=rep(TRUE, 11), tenta_dist=c(0,1,1,1,1,2,2,2,2,2,3))

  expected_output <- c(0,1,1,1,1,2,2,2,2,2,3)

  expect_equal(dijkstra_output, expected_output)
})
