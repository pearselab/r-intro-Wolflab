#Q3.1
pussy <- list(length=20, weight=10, breed="Bristol")
class(pussy) <- "feline" # I don't want to use "cat" because I'll get confused with the method "cat"

print.feline <- function(x, ...){
  cat("This ", x$breed, "weighs ", x$weight, "kg\n")
}

race <- function(first, second){
  if(!inherits(first, "feline") | !inherits(second, "feline"))
    stop("You haven’t given me two felines!")
  if(first$weight < second$weight){
    print("First feline won!")
    return(first)
  }
  print("Second feline won!")
  return(second)
}

#Q3.2
useless_information = list("empty")
class(useless_information) <- "point"
