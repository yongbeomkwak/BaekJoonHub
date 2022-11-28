
def solution(distance, rocks, n):
    answer = 0
    rocks.sort()
    
    left = 0 
    right = distance 

    #이분 탐색의 값은 바위간 거리
    while left<=right:
        cnt = 0 
        prev = 0
        mid = (left+right)//2
        
        for rock in rocks:
            if(rock-prev < mid): # 기준보다 바위간 거리가 작으면, 현제 바위 제거
                cnt += 1 # 제한 바위 개수 증가
            else:
                prev = rock # 아닐 시 현재 바위로 이전 좌표를 옮김
        
        prev = rocks[-1] # 마지막 계산을 위해
        if(distance - prev < mid): # 도착 바위 - 끝 바위 역시 비교
            cnt +=1
        

        if(cnt<=n):
            answer = max(answer,mid)
            left = mid+1
        
        else:
            right = mid -1
        
        
        
    
    
    return answer