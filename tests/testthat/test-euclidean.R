test_that("GDC is calculated correctly.", {
  # Test suite from instructions
  expect_equal(euclidean(123612, 13892347912), 4)
  expect_equal(euclidean(100, 1000), 100)
  expect_equal(euclidean(-100, 1000), 100)
  
  

  # The authors own tests
  expect_equal(euclidean(123612, 13892347912), 4)
  expect_equal(euclidean(100, 1000), 100)
  expect_equal(euclidean(0, 341), 341)
  expect_equal(euclidean(1299709, 104729), 1)
  
  expect_equal(euclidean(144 ,120), 24)
  expect_equal(euclidean(0 ,0), 0)
})


test_that("Wrong input throws an error.", {
  expect_error(euclidean("100", 1000))
  expect_error(euclidean(100, "1000"))
  expect_error(euclidean(TRUE, "1000"))
  #expect_error(euclidean(64L, 35L)) #should it be able to work with integers?
})
