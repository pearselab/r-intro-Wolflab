from __future__ import print_function
# just seeing if I can write a function that tests for primeness in Python. Only works if numb > 4
def is_prime(numb):
    for i in range(numb-1,2,-1):
        if numb % i == 0:
            answer = False
            break
        else:
            answer = True
    return answer
 
# Let us  test            
x = 4
if is_prime(x):
    print( x, "is prime")
else:
    print(x, "is not prime")
            
            
            