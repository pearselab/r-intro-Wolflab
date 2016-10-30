
sim.lost.prof.dist <- function(n){
  lat <- 0
  long <- 0
  dist.vec <- c()
  for(i in 1:n){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    dist.to.origin <- sqrt((lat*laf) + (long*long))
    dist.vec <- c(dist.vec, dist.to.origin)
  }
  return(dist.vec)
}
plot(sim.lost.prof.dist(100),type="o")