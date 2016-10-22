# 22 Oct 2016. start 9:20 am
#2.6 Exercises
#1. Write a loop that prints out the numbers from 20 to 10
for (i in 20:10){
  print(i)
}

#2. Write a loop that print out only the numbers from 20 to 10 that are even
is_even <- function(x){
  if (x %% 2 == 0){
    return (TRUE)
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

is_prime <- function(x){
  for (i in x:2){
    if (is_even(i)){
      if (x %% i == 0){
        cat(x, "is not prime")
        break
      }
  }else cat(x, "is prime")
  }
}

is_prime(81)

# 4. Write a loop that prints out the numbers from 1 to 20, printing “Good: NUMBER” if the number is
# divisible by five and “Job: NUMBER” if then number is prime, and nothing otherwise.
# 5. A biologist is modelling population growth using a Gompertz curve, which is defined as y(t) = a.e−b.e−c.t
# where y is population size, t is time, a and b are parameters, and e is the exponential function. Write
# them a function that calculates population size at any time for any values of its parameters.
# 6. The biologist likes your function so much they want you to write another function that plots the progress
# of the population over a given length of time. Write it for them.
# 7. The biologist has fallen in love with your plotting function, but want to colour y values above a as blue,
# and y values above b as red. Change your function to allow that.
# 8. You are beginning to suspect the biologist is taking advantage of you. Modify your function to plot in
# purple any y value that’s above a and b. Hint: try putting 3==3 & 2==2 and 3==4 | 2==2 into an if
# statement and see what you get. Using this construction may make this simpler.