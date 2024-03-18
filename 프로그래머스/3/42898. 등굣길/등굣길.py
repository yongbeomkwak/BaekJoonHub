def solution(m, n, puddles):
    
    dp = [[0 for _ in range(m+1)] for _ in range(n+1)]
    
    DIV = 1000000007
    
    map = [[0 for _ in range(m+1)] for _ in range(n+1)]
    
    
    for puddle in puddles:
        map[puddle[1]][puddle[0]]= 1
    

    
    dp[1][1] = 1 
    
    
    for x in range(1,n+1):
        for y in range(1,m+1):
            if x == 1 and y == 1:
                continue
            
            if map[x][y] == 1:
                continue
                
            dp[x][y] = (dp[x-1][y] + dp[x][y-1]) % DIV
                
                
                
                
    return dp[n][m]