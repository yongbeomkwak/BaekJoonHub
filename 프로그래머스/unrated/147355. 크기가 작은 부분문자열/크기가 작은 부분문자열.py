def solution(t, p):
    
    
    lt = len(t)
    lp = len(p)
    ip = int(p)
    
    ans = 0
    for i in range(lt-lp+1):
        
        if(ip >= int(t[i:i+lp])):
            
            ans +=1 
    
    
    
    

    return ans