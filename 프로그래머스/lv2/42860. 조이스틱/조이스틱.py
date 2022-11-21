def solution(name):
    l = len(name)
    now = "A" * l
    zOrd = ord("Z")
    aOrd = ord("A")
    idx = 0
    answer = 0
    lr = l -1
    
    for i in range(l):
        target = ord(name[i])
        answer += min(target-aOrd,zOrd-target+1)
        idx = i+1
        while (idx < l and name[idx] == "A"):
            idx += 1
        
        left = i
        right = l - idx
        
        print(left,right)
        
        lr =  min(lr,left+right + min(left,right))
        
        
        
        
    

    return answer +lr