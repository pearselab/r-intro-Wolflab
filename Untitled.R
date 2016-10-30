

get_abundance_matrix <-function(filepath = "/Users/Paul13/Dropbox/docs_wolf/Python_files/2016_Programming/r-intro-Wolflab/species_list.csv"){
  species_data <- read.csv(filepath, header = TRUE, as.is = TRUE )
  return(species_data)
}
print(get_abundance_matrix())

