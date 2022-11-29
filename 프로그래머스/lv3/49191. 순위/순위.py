def solution(n, results):
    prev = [[False for _ in range(n+1)] for _ in range(n+1)]
    answer = 0
    
    for result in results:
        w,l = result
        prev[w][l] = True
    
    
    for k in range(1,n+1):
        for i in range(1,n+1):
            for j in range(1,n+1):
                if(prev[i][k] and prev[k][j]):
                    prev[i][j] = True
   
    for i in range(1,n+1):
        cnt = n -1
        for j in range(1,n+1):
            if(prev[i][j] or prev[j][i]):
                cnt -=1
    
        if(cnt == 0):
            answer += 1
            
    
    return answer