from sys import *
from collections import *
import heapq

def check_3(n:str)-> bool:
    ret:int=0
    
    for c in n:
        ret+=int(c)
    
    return True if (ret%3==0) else False

if __name__ =='__main__':
    setrecursionlimit(2500)
    
    num=stdin.readline()[:-1]
    
    if(check_3(num)==False): #3의 배수는 모든 자릿수 합이 3의 배수여야함 
        stdout.write(f'-1')
    
    else:
        ret = int("".join(sorted(num,reverse=True))) ##문자열 내림차순 정렬후(리스트) , ""과 .join으로 문자열 상태로
        if(ret%10!=0): #10의 배수체크
            stdout.write(f'-1')
        else:
            stdout.write(f'{ret}')
    
    
                

    
    
    
 
   
    
   
