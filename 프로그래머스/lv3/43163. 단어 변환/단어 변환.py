
def get_nextWord(current,words):
    
    
    for word in words:
        
        cnt = 0
        
        for c,w in zip(current,word):
            if(c != w):
                cnt +=1
            
        
        if(cnt == 1):
            yield word
        
    
    
    
    

from collections import *

def solution(begin, target, words):
  
    dist ={begin:0}
    q = deque()
    
    q.append(begin)
    
    while q:
        now = q.popleft()
        
        for next_word in get_nextWord(now,words):
            if(next_word in dist):
                continue
            
            dist[next_word] = dist[now] + 1
            
            q.append(next_word)
            
    

    return dist.get(target,0)