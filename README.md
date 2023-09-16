[![check-standard](https://github.com/TheLaughingDuck/advRlab3package/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/TheLaughingDuck/advRlab3package/actions/workflows/check-standard.yaml)

# advRlab3package
 A repository for lab 3 in the course Advanced Programming in R
 

 
 See [Github Docs](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) for help with formatting this type of document.

## Instructions for testing-driving this package

* In the R console, set working directory to this repository. For example with `setwd(...)`.

* Load the devtools package: `library(devtools)`.

* Run `load_all()`.

* Manually test the desired functions.

See the book [R Packages](https://r-pkgs.org/whole-game.html#sec-whole-game-load-all) by Wickham, Bryan for details about testing R packages.

## Instructions for creating a new funtion for this package [Inspired by](https://r-pkgs.org/whole-game.html#sec-whole-game-document)

* Select a name for the function, let's say `new_function`. Create a file called `new_function.R`.

* Inside `new_function.R`, create the functions basic structure (definition).

* In RStudio, put the cursor somewhere *inside* the function body. In the RStudio top menu's, go to `Code > Insert Roxygen Skeleton`.

* Edit (as required) the Roxygen comment that has been added above the function definition.

* In order to "trigger" this Roxygen comment, run `document()` in the R console (given that you are in the right directory).

## Instructions for creating Unit Tests (for one file/function) [Inspired by](https://r-pkgs.org/whole-game.html#sec-whole-game-document)

* In R console, load the `testthat` package.

* Run the `use_testthat()` function.

* Run `use_test("new_function")` where new_function is a function you wish to create unit tests for.

* Create the unit tests yourself (using this template for reference):

  ```
  test_that("Text explaining what this test will test", {
    expect_equal(new_function(arg1, arg2), expected_output)
  })
  ```

* Finally you can test all your unit tests by running `test()` in the R console.

## Additional things to do (with this document)

* Create a set of instructions for downloading and running this package.

## Additional things to fix (BUGS)

* when running `check()`, the following error is shown: "Error in euclidean(123612, 13892347912) : 
     could not find function "euclidean".

* There seems to be some kind of error with the Roxygen examples of both dijkstra and euclidean. They wont run.
