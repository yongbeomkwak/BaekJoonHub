MAX = 9
def solution(N, number):
    if N == number:
        return 1
    answer = -1

    dp = [0,{N}]
    
    for k in range(2,MAX):
        candidate = [int(str(N)*k)]
        for i in range(1,k):
            for j in range(1,k):
                if (i+j) != k:
                    continue
                for a in dp[i]:
                    for b in dp[j]:
                        candidate.append(a + b)
                        candidate.append(a - b)
                        candidate.append(a * b)
                        if b != 0:
                            candidate.append(a//b)
                        if a != 0:
                            candidate.append(b//a)
                            
        dp.append(set(candidate))
        if number in candidate:
           
            return k
        
            
    
    
    return -1