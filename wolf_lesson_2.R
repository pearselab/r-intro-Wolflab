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

# So we input what? output is simulating each species once, so one abundance value?
# I am not sure of the input for this. Do I have a list of lists for each species? 
# p and lambda for each species. Then I run my function n times for each species, 
# where n is the number of sites?
# could run simulation for each species for each site. Or maybe better to run set first param of rpois
# to number of sites?

# Decided, after discussion with collaborators, if said ecologist cannot write code, then they may have the input
# in a csv format. So this code expects a csv input with a header and three columns: 1. species (a species name includes
# a genus, followed by a space, followed by the specific epithet - the space should not be a problem since it 
# is one character in the string. col 2 is probability of presence (p) and 3. Lambda for abundance (given presence)
# Start out simply with file in same path as script (must learn how to control path in R!)


#This works:
# for(i in 1:nrow(species_data)){
#   species <- species_data[i,1]
#   p <- species_data[i,2]
#   lam <- species_data[i,3]
#   ab <- abundance(p, lam)
#   cat(species, ab, sep = " ", "\n")
# }

get_abundances_for_site <- function(species_data){
  output <- c()
  for(i in 1:nrow(species_data)){
    species <- species_data[i,1]
    p <- species_data[i,2]
    lam <- species_data[i,3]
    ab <- abundance(p, lam)
    info <- list(species, ab)
    output <- c(output,info)
    #cat(species, ab, sep = " ", "\n")
  }
  return(output)
}

# Now I need to loop over sites
# Ask Will about data frames. Seems silly to loop over a date frame or even a matrix


#Now do this as a function using a matrix:
# sim.comm <- function(spp.lam, spp.p, spp.names, n.sites){
#   #Make a matrix that you're going to output
#   #Loop over all the species
#   #Use your species simulation function and put that in the right row in your matrix
#   #End loop
#   #Do any cleanup you want on the matrix and return
# }
#Here is the overriding function to get matrix:
get_abundance_matrix <-function(my.file = "/Users/Paul13/Dropbox/docs_wolf/Python_files/2016_Programming/r-intro-Wolflab/species_list.csv", number_of_sites){
  species_data <- read.csv(my.file, header = TRUE, as.is = TRUE )
  numb_species <- length(get_abundances_for_site(species_data)[,1])#count species
  abundance_matrix <- matrix(nrow = number_of_sites, ncol = numb_species)#make matrix
  abundance_matrix[,1] <- get_abundances_for_site(species_data)[,1] #Still trying to get species into column 1
  for(i in number_of_sites){
    if(i > 1){ # ignore first colun because this is species list
      abundance_matrix[,1] <- get_abundances_for_site[,2]# get abundance vector into matrix
    }
  }
  return(abundance_matrix)
}
print(get_abundance_matrix(number_of_sites =  3))
# Note wil Will: I tried really hard to loop over species as the outer loop, as you suggest but I just kept getting
# tripped up. So I went back to looping over sites, and almost got it working. Note that this fails when I run this
# from within Rstudio, but works when from command line (cannot find the file). I double checked file locations.
# I know I still have a problem with the matrix dimensions, but I cannot find it. In retrospect I should have stuck
# with the data.frame and simply converted that to a matrix

# 14. Professor Savitzky approaches you with a delicate problem. A member of faculty became disoriented
# during fieldwork, and is now believed to be randomly wandering somewhere in the desert surrounding
# Logan. He is modelling their progress through time in five minute intervals, assuming they cover a
# random, Normally-distributed distance in latitude and longitude in each interval. Could you simulate this
# process 100 times and plot it for him?

# Not sure what to plot so I plotted distance to origin. Is this correct? I tried really 
# to plot position as lat long but could not get anything to work
# Also, I had no information about what the mean and standard deviation should be on the movement
# Which is strange. I just went with the defaults, but I had no logical reason for doing that
# 

sim.lost.prof.dist <- function(n){
  lat <- 0
  long <- 0
  dist.vec <- c()
  while(i <= n){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    dist.to.origin <- sqrt((lat*lat) + (long*long))
    dist.vec <- c(dist.vec, dist.to.origin)
    i= (i+1)
  }
  return(dist.vec)
}
#plot(sim.lost.prof.dist(100),type="o")

#ok - I will try to plot position in space
# I cheated a bit on this one - I looked at Mallory's to see how to plot lat and long!
sim.lost.prof.point <- function(n){
  lat <- 0
  long <- 0
  lat.vec <- c()
  long.vec <- c()
  while(i <= n){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    lat.vec <- c(lat.vec, lat)
    long.vec <- c(long.vec, long)
    i= (i+1)
  }
  plot(lat.vec, long.vec, type = "l", lty=3)
}
#sim.lost.prof.point(100)

# let's assume that distance intervals are in 10 metres increments.
# 1609 metres to a mile 5 miles = 8045 = 804.5 units of distance
# but I am setting this to 34.5 metres just for testing
time_to_dead_prof <- function(n){
  lat <- 0
  long <- 0
  dist.to.origin <- 0
  count <- 0
  while(dist.to.origin < 34.5){
    lat <- lat + rnorm(1, mean = 0, sd = 1)
    long <- long + rnorm(1, mean = 0, sd = 1)
    dist.to.origin <- sqrt((lat*lat) + (long*long))
    #print(dist.to.origin)
    count <- count + 1
    if(count > n){
      print("prof still wondering")
      break
    }
  }
  cat("it took", (count*5), "minutes before professor fell off cliff")
}
# Here n is the max number of 5 min intervals you wish to simulate the process before
# you decide that you no longer care about life of said professor
time_to_dead_prof(1000)
# ok, I do see the problem with this. Even if you go to the full max loops it still says
# that professor fell off cliff after n*5 minutes
# easy fix: move the cat statement to an if loop (if dist.to.origin > xx)


