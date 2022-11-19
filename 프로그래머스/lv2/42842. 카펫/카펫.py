def solution(brown, yellow):
    answer = []
    
    total = brown + yellow
    
    w = 3
    
    while True:
        for h in range(3,w+1):
            
            if(h*w != total):
                continue
            
            if((w-2) * (h-2) == yellow):
                answer.append(w)
                answer.append(h)
                break
        
        if(len(answer) != 0):
            break
        
        w +=1

    return answer