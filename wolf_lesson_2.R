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

pop_size_at_t <- function(t, a, b, c){
  y = a*(exp(-b*(exp(-c*t))))
  return(y)
}
print(pop_size_at_t(194,20,33,22))
# Well, I think the above is working, but have some doubts

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


prob_presence <- function(numb_sites, p){
  return(sum(rbinom(numb_sites, 1, p))/numb_sites)
}
print(prob_presence(100, 0.1))
#OK - I thinkthat is giving me what I want. Whew