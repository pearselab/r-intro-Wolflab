# 22 Oct 2016. start 9:20 am

#First some notes from lecture:

# Have to change the acutal index to make changes permanent!
unchanged <- changed <- c("a", "c", "e")
for(each in changed){
  each <- toupper(each)
  print(each)
} 
identical(changed, unchanged) #No change has happened
changed

for(i in 1:length(changed)){
  changed[i] <- toupper(changed[i])
}
identical(changed, unchanged) #Success!
changed

#2.6 Exercises
#1. Write a loop that prints out the numbers from 20 to 10
for (i in 20:10){
  print(i)
}

#2. Write a loop that print out only the numbers from 20 to 10 that are even
is_even <- function(x){
  if (x %% 2 == 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

for (i in 20:10){
  if (is_even(i)){
  print(i)
}
}

#3. Write a function that calculates whether a number is a prime number (hint: what does 2 %% 3 give you?)
# The hint didn't help. I had to cheat and copy from internet.


is_prime <- function(num) {
  if (num == 2) {
    TRUE
  } else if (any(num %% 2:(num-1) == 0)) {# see example function of a"any"
    FALSE
  } else { 
    TRUE
  }
}

b <- 37
if(is_prime(b)){
  cat(b, "is prime")
} else {
  cat(b, "is not prime")
}



# 4. Write a loop that prints out the numbers from 1 to 20, printing “Good: NUMBER” if the number is
# divisible by five and “Job: NUMBER” if then number is prime, and nothing otherwise.

div_by_five <- function(x) {
  if(x %% 5 == 0) {
    return(TRUE)
  }else{
    return(FALSE)
  }
}
  

for (i in 1:20){
  if(i == 5){
    cat("Damn Good Job", i, "\n")
  }
  else if (div_by_five(i)){
    cat("Good: ",i, "\n")
  }else if(is_prime(i)){
    cat("job: ", i, "\n")
  }
}

# 4. A biologist is modelling population growth using a Gompertz curve, which is defined as y(t) = a.e−b.e−c.t
# where y is population size, t is time, a and b are parameters, and e is the exponential function. Write
# them a function that calculates population size at any time for any values of its parameters.

#First here is Marley's code in case I can help her:
gompertz<-function(time, a, b, c){
  y<-a*exp(-b*exp(-c*time))
  return(y)
}

pop_size_at_t <- function(t, a, b, c){
  y = a*(exp(-b*(exp(-c*t))))
  return(y)
}
print(pop_size_at_t(4,20,33,1))
print(gompertz(4, 20, 33, 1))

# Well, I think the above is working, but have some doubts
# Marley's works as mine. Doubts caused by not finding arguments that would help testing. Got those eventually.

# 5. The biologist likes your function so much they want you to write another function that plots the progress
# of the population over a given length of time. Write it for them.

pop_size_over_time <- function(final_time,a,b,c){
  for (i in 1:final_time){
    cat(i, ",", pop_size_at_t(i, a, b, c), "\n")
  }
}
#pop_size_over_time(30,2000,3000,2)# still don't like look of output

# 6. The biologist likes your function so much they want you to write another function that plots the progress
# of the population over a given length of time. Write it for them.


get_pop_growth_list <- function(final_time,a,b,c){
  pop_growth_list <- c()#create empty list
  for (i in 1:final_time){
    current_pop_size <- pop_size_at_t(i, a, b, c)
    pop_growth_list <- c(pop_growth_list, current_pop_size)#add to growing list
  }
  return(pop_growth_list)
}
final_time <- 30
a <- 2000
b <- 50
c <- 0.4
d = get_pop_growth_list(final_time,a,b,c)

plot(d,type="o", col = ifelse(d < a,'black',ifelse(b, 'blue', "red")), xlab="Generation", ylab = "population size") # that was easy

#Here is how Karen Mock did it - she made a vector of time intervals, then looped across them and used them in the plot
# Clever:
GompFun <- function (a,b,c,d) { # a,b,c, constants, d = max time
  t <- 0
  pop_vector <- 0
  time_span <- c(1:d)
  for (i in time_span) {
    t <- c(t,i) # incrementing to make a vector
    pop_size <- a*exp(-b*exp(-c*i)) # within-function variable
    pop_vector <-  c(pop_vector, pop_size) # incrementing to make a vector
  }
  plot(t, pop_vector, type = "l")
}
GompFun(.22,6,.5,10)

#pop_size_over_time(final_time,a,b,c)
# 8. You are beginning to suspect the biologist is taking advantage of you. Modify your function to plot in
# purple any y value that’s above a and b. Hint: try putting 3==3 & 2==2 and 3==4 | 2==2 into an if
# statement and see what you get. Using this construction may make this simpler.

# I am starting to suspect that either my initial function is not working, or I am missing a key element
# taking too much time. I now see that I need to build a separate function to determine col

# 9. Write a function that draws boxes of a specified width and height that look like this (height 3, width 5):
#   *****
#   *   *
#   *****

draw_box <- function(height,width){
  cat(paste(replicate(width, "*"), collapse = "")) #This is the top line
  cat("\n") # new line
  for(i in 3:height){
    cat("*", paste(replicate((width-4), " "), collapse = ""), "*", "\n") # draw the sides for middle rows
  }
  cat(paste(replicate(width, "*"), collapse = ""), "\n") 
}
draw_box(4,14)

#10.
mid <- function(height){
  return (floor((height-2)/2))
}

draw_text_box <- function(height,width, text){
  if(nchar(text) > width-4){
    return("text too long")
  }
  cat(paste(replicate(width, "*"), collapse = "")) #This is the top line
  cat("\n") # new line
  for(i in 1:mid(height)){#draw sides above text
    cat("*", paste(replicate((width-4), " "), collapse = ""), "*", "\n") # draw the sides for middle rows
  }
  cat("*", text, paste(replicate(((width-5)-nchar(text)), " "), collapse = ""), "*","\n")
  for(i in 1:mid(height)){#draw sides below text
    cat("*", paste(replicate((width-4), " "), collapse = ""), "*", "\n") # draw the sides for middle rows
  }
  cat(paste(replicate(width, "*"), collapse = "")) 
}
draw_text_box(9,24, "1234")

# OK - this is getting a bit tedious. I mean, I do see how it is helping with functions and indexing
# I am also noticing that my function is starting to get rather long and I should break it down further

# 12. In ecology, hurdle models are often used to model the abundance of species found on surveys. They
# first model the probability that a species will be present at a site (drawn, for example, from a Bernoulli
# distribution) and then model the abundance for any species that is present 
# (drawn, for example, from the Poisson distribution). Write a function that simulates 
# the abundance of a species at n sites given a probability of presence (p) and that its abundance
# is drawn from a Poisson with a given λ. Hint: there is no Bernoulli distribution in R, but the Bernoulli
# is a special case of what distribution?...

presence <- function(p){
  return(rbinom(1, 1, p))
}
#print(presence(0.5))
#OK - I think that is giving me what I want for first step
#But now we need to hurdle to next step. If present, simulate abundance with 

abundance <- function(p, lam) {
  if(rbinom(1, 1, p) == 1){
    return(rpois(1, lam))
  }else{
    return(0)
  }
}
#abundance(0.5, 100.3)# I think that is working.Not sure if this is how you want it implemented

# 13. An ecologist really likes your hurdle function (will you never learn?). Write them a function that simulates
# lots of species (each with their own p and λ) across n sites. Return the results in a matrix where each
# species is a column, and each site a row (this is the standard used for ecology data in R).

# I will now delete all my old stuff - I should be able to retrieve it by going to older version in git or github
# Attempting Will's approach

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
  for(k in 1:length(species.list)){ # not sure why looping over species first
    for(j in 1:n.sites){ # now looping across n.sites
      my.abundance.matrix[j,k] <- abundance(p.list[k], lam.list[k])
    }
  }
  return(my.abundance.matrix)
}
print(sim.comm(species.list, p.list, lam.list, 6))

# 14. Professor Savitzky approaches you with a delicate problem. A member of faculty became disoriented
# during fieldwork, and is now believed to be randomly wandering somewhere in the desert surrounding
# Logan. He is modelling their progress through time in five minute intervals, assuming they cover a
# random, Normally-distributed distance in latitude and longitude in each interval. Could you simulate this
# process 100 times and plot it for him?


# I had no information about what the mean and standard deviation should be on the movement
# Which is strange. I just went with the defaults, but I had no logical reason for doing so

sim.lost.prof.dist <- function(n){
  lat <- 0
  long <- 0
  dist.vec <- c()
  for(i in 1:n){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    dist.to.origin <- sqrt((lat*lat) + (long*long))
    dist.vec <- c(dist.vec, dist.to.origin)
  }
  return(dist.vec)
}
plot(sim.lost.prof.dist(100),type="o")

#ok - I will try to plot position in space
# I cheated a bit on this one - I looked at Mallorys to see how to plot lat and long!
sim.lost.prof.point <- function(n){
  lat <- 0
  long <- 0
  lat.vec <- c()
  long.vec <- c()
  i <- 0
  for(i in 1:n){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    lat.vec <- c(lat.vec, lat)
    long.vec <- c(long.vec, long)
    i= (i+1)
  }
  plot(lat.vec, long.vec, type = "l", lty=3)
}
sim.lost.prof.point(100)

# lets assume that distance intervals are in miles (must be a fast professor)

time_to_dead_prof <- function(){
  lat <- 0
  long <- 0
  dist.to.origin <- 0
  for(i in 1:200){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    dist.to.origin <- sqrt((lat*lat) + (long*long))
    if(dist.to.origin > 5){
      cat("it took", (i*5), "minutes before professor fell off cliff")
      break
    }
  }
}
# Here 200 is the max number of 5 min intervals Dr. Savitzky wishes to simulate the process
# before he no longer cares about life of said professor
time_to_dead_prof()


