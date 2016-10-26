pussy <- list(length=20, weight=10, breed="Bristol")
class(pussy) <- "feline" # I don't want to use "cat" because I'll get confused with the method "cat"

print.feline <- function(x, ...){
  cat("This ", x$breed, "weighs ", x$weight, "kg\n")
}

