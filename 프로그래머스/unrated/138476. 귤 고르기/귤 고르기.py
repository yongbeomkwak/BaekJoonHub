from collections import * 
def solution(k, tan):
    answer = 0
    n = len(set(tan))
    tmp = list(Counter(tan).most_common())
   
    sorted_list = list(map(lambda x:x[1],tmp))
    

    
    cnt = 0
    
    for i in range(n):
        if(k<=0):
            break
        k -= sorted_list[i]
        cnt = i
    
    return cnt+1