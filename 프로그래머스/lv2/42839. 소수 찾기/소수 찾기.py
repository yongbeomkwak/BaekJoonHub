from itertools import *
from math import *
def isPrime(n:int) -> bool:
    end = int(sqrt(n))
    if(n == 0 or n == 1):
        return False
    elif (n== 2 or n ==3):
        return True
    
    for i in range(2,end+1):
        if(n%i == 0):
            return False
    
    return True

def solution(numbers):
    
    l = len(numbers)
 

    tmp = []
    for i in range(1,l+1):
        p = permutations(list(numbers),i)
        for n in p:
            n = int(''.join(n))
            if(isPrime(n)):
                tmp.append(n)
    
    return len(set(tmp))