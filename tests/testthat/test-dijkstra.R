# A template for test cases
#test_that("multiplication works", {
#  expect_equal(2 * 2, 4)
#})


test_that("dijkstra() output is in correct format", {
  # Testing for correct output format

  # (This test is not well thought through, and should be improved when possible)

  graph <- data.frame(v1=c(1,4,5,8,9), v2=c(7,8,0,2,1), w=c(1,2,3,1,1))

  dijkstra_output <- dijkstra(graph, 4)

  comparison <- length(dijkstra_output) == 3

  expect_equal(TRUE, comparison)
})


test_that("dijkstra() correctly works for a known graph", {
  # Testing a specific graph with known distances

  graph <- data.frame(v1 = c(1,1,1,1,2,2,2,2,2,3,3,3,4,4,4,5,5,6,6,7,7,8,9,10,10,11),
                      v2 = c(2,3,4,5,7,3,1,5,8,6,2,1,9,10,1,1,2,3,7,6,2,2,4,4,11,10),
                      w = rep(1,26))

  dijkstra_output <- dijkstra(graph, 1)

  expected_output <- data.frame(name=1:11, visited=rep(TRUE, 11), tenta_dist=c(0,1,1,1,1,2,2,2,2,2,3))

  expect_equal(dijkstra_output, expected_output)
})
