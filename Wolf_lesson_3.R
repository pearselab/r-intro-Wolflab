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
new.feline <- function(length, weight, breed){
  output <- list(weight=weight, breed=breed)
  class(output) <- "feline"
  return(output)
}
#Q3.2
location_1 = list(lat = 23.4, long = 45.34)
class(location_1) <- "point"

new.point <- function(lat = lat, long = long){
  output <- list(lat = lat, long = long)
  class(output) <- "point"
  return(output)
}
new.point(location_2(11,13))
          