
abundance <- function(p, lam) {
  if(rbinom(1, 1, p) == 1){
    return(rpois(1, lam))
  }else{
    return(0)
  }
}

#Now get the lists of species, p, lambdas
get.species.list <- function(my.file = "/Users/Paul13/Dropbox/docs_wolf/Python_files/2016_Programming/r-intro-Wolflab/species_list.csv"){
  species.data <- read.csv(my.file, header = TRUE, as.is = TRUE )
  return(species.data)
}
species.data <- get.species.list() # Just get data from csv file into data frame
species.list <- as.vector(species.data[["Species"]]) # Make species list from species in data frame
p.list <- as.vector(species.data[["p"]]) # Make p list from p in data frame
lam.list <- as.vector(species.data[["lambda"]]) # Make lambda list from lambdas in data frame

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
print(sim.comm(species.list, p.list, lam.list, 4))


