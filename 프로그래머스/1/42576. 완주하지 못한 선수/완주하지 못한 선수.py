def solution(participant, completion):
    
    hash ={}
    
    for pa in participant:
        
        if pa not in hash:
            hash[pa] = 1 
            
        else :
            hash[pa] += 1 
     

    for com in completion:
        hash[com] -= 1
        
        if hash[com] == 0 :
            del hash[com]
 

    for k in hash :
        return k
