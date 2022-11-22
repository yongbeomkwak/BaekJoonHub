def solution(tr):
    l = len(tr)  
   
    dp = [[0 for _ in range(1,i+1)] for i in range(1,l+1)]
    for i in range(l):
        dp[l-1][i] = tr[l-1][i]
    
    for h in range(l-2,-1,-1):
        for w in range(h+1):
            dp[h][w] = tr[h][w] + max(dp[h+1][w],dp[h+1][w+1])
            
    
            

    return dp[0][0]