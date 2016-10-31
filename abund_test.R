
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

species.list <- (c(species_data["Species"]))
p.list <- (c(species_data["p"]))
lam.list <- (c(species_data["lambda"]))


# Will's solution:
sim.comm <- function(species.list, p.list, lam.list, n.sites){
  for(species in species.list){
    
  }
}
#Make a matrix that you're going to output
# Loop over all the species
# Use your species simulation function and put that in the right row in your matrix
# End loop
# Do any cleanup you want on the matrix and return
# }