def solution(arr):
    answer = []
    # [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    
    prev = -1
    
    for n in arr:
        if(n == prev):
            continue
        else:
            answer.append(n)
            prev = n
        
    
    
    
    return answer