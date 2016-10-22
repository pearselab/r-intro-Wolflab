def is_prime(numb):
    for i in range(numb-1,2,-1):
        answer = False
        if numb % i == 0:
            break
        else:
            answer = True
    return answer
 
# Let us  test            
x =98
if is_prime(x):
    print x, "is prime"
else:
    print x, "is not prime"
            
            
            