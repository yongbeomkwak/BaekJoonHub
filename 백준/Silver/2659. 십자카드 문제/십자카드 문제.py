from sys import *
from collections import *
from queue import *


def find_clock_num(num:int):
    clock_num=num
    for _ in range(3):
        num=(num%1000) *10 + num//1000 # 회전하기 (나머지)+ 몫 4321 -> 3214
        if(clock_num>num):
            clock_num=num
    
    return clock_num
        


if __name__ == "__main__":
    
    n=int("".join(stdin.readline()[:-1].split()))
    
    dest=find_clock_num(n)
    
        
    cnt:int =0
    i=1111
    while(i<=dest):
        if(find_clock_num(i)==i):
            cnt+=1
        i+=1
        

    stdout.write(f'{cnt}')
        
        
   
    
    
    
    
    

    
   
    
    