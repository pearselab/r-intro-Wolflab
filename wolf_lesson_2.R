# 22 Oct 2016. start 9:20 am
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
# The hint didn't help.


is_prime <- function(num) {
  if (num == 2) {
    TRUE
  } else if (any(num %% 2:(num-1) == 0)) {
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
  if (div_by_five(i)){
    cat("Good: ",i, "\n")
  }else if(is_prime(i)){
    cat("job: ", i, "\n")
  }else{
    cat(i, "\n")
  }
}

# A biologist is modelling population growth using a Gompertz curve, which is defined as y(t) = a.e−b.e−c.t
# where y is population size, t is time, a and b are parameters, and e is the exponential function. Write
# them a function that calculates population size at any time for any values of its parameters.

pop_size_at_t <- function(t, a, b, c){
  y = a*(exp(-b*(exp(-c*t))))
  return(y)
}
print(pop_size_at_t(194,20,33,22))
# Well, I think the above is working