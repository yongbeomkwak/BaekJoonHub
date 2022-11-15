from collections import *
from itertools import *
def solution(s):
    
    answer = []
    
    if(len(s) == 1):
        return 1
    
    end = len(s) // 2 + 1
    
    for i in range(1,end):
        tmp = ""
        pattern = s[:i]  #현재 패턴 
        cnt = 1
        
        for j in range(i,len(s),i):
            next = s[j:j+i] # 다음 글자 
            if(pattern == next): # 같으면 , 개수 증가
                cnt += 1
            else:
                if cnt != 1: 
                    tmp += str(cnt) + pattern
                else:
                    tmp += pattern
                
                pattern = s[j:j+i] # 다음 패턴
                cnt = 1  # 개수 초기화
        
        if cnt != 1:
            tmp += str(cnt) + pattern
        
        else:
            tmp += pattern
        
        
        answer.append(len(tmp))
        
        
                    
    

    

    
    return min(answer)