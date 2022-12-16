def solution(num, k):
    
    ans = -1
    snum = str(num)
    sk = str(k)
    for i,j in enumerate(snum):
        if(j == sk):
            ans = i +1
            break
    
    
    return ans