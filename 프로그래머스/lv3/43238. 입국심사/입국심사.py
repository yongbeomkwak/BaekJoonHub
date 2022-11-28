def solution(n, times):
    times.sort()
    left = 0
    right = times[-1] * n
    answer = 0
    
    while(left<=right):
        mid = (left+right)//2
        
        finish = 0
        for time in times:
            finish += (mid//time)
        
        if(finish<n):
            left = mid+1
        else:
            answer = mid
            right = mid-1
    
   
    return answer