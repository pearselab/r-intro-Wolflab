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

is_prime <- function(x){
  for (i in x-1:3){
    if (x %% i == 0){
        answer <- FALSE
        break
  } else {
      answer <- TRUE
        }
  } {return(answer)}
}

b <- 10
if(is_prime(b)){
  print ("is prime")
} else {
  print("is not prime")
}



# 4. Write a loop that prints out the numbers from 1 to 20, printing “Good: NUMBER” if the number is
# divisible by five and “Job: NUMBER” if then number is prime, and nothing otherwise.

