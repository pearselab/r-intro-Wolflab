## Functions
## = abundance function is lovely! :D
abundance <- function(p, lam) {
  if(rbinom(1, 1, p) == 1){
    return(rpois(1, lam))
  }else{
    return(0)
  }
}

## Don't use absolute paths in GitHub
## - header=TRUE is the default for read.csv; as.is=TRUE is a good idea!
species.data <- read.csv("species_list.csv", as.is=TRUE)

## Load your sim.comm function
sim.comm <- function(species.list, p.list, lam.list, n.sites){
  my.abundance.matrix <- matrix(data = 0, nrow = n.sites, ncol = length(species.list)) # make empty matrix
  colnames(my.abundance.matrix) <- species.list # assign column names from the species list
  #print(my.abundance.matrix) # just checking - empty matrix good
  for(k in 1:length(species.list)){ 
    for(j in 1:n.sites){ # now looping across n.sites
      my.abundance.matrix[j,k] <- abundance(p.list[k], lam.list[k])
    }
  }
  return(my.abundance.matrix)
}


## Two different ways of calling your function using this data.frame that are:
## * easier to read
## * require less code
## - "with" is in the exercises of lesson 1
#print (sim.comm(species.data$Species, species.data$p, species.data$lambda, 4))
print(with(species.data, sim.comm(Species, p, lambda, 4)))
## ...also notice how:
## * I'm not using "[[]]" to pull out parts of the data.frame (I'm using "$"), and I'm not coercing anything ("as.vector")
## * I'm not explicitly calling "print" on the output as that's done automatically for me