get.species.list <- function(my.file = "/Users/Paul13/Dropbox/docs_wolf/Python_files/2016_Programming/r-intro-Wolflab/species_list.csv"){
  species.data <- read.csv(my.file, header = TRUE, as.is = TRUE )
  return(species.data)
}

species.list <- (c(species_data["Species"]))
print(species.list)
p.list <- (c(species_data["p"]))
print(p.list)