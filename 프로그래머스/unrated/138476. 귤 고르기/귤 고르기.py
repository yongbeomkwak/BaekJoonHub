from collections import * 
def solution(k, tan):
    answer = 0
    n = len(set(tan))
    tmp = list(Counter(tan).most_common()) #(key:conut) 값을 count를 기준으로 정렬

   
    sorted_list = list(map(lambda x:x[1],tmp)) #(key:countd)에서 count만 추출
    
    
    cnt = 0
    
    for i in range(n):
        if(k<=0):
            break
        k -= sorted_list[i]
        cnt = i
    
    return cnt+1
