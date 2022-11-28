
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
        

        if(cnt<=n): #만약 현재 제거 개수가 만족하면
            answer = max(answer,mid)
            left = mid+1
            # 거리의 최댓값을 찾기 위해 left를 옮긴다
        else: #만약 개수초과면
            right = mid -1 #right을 이동시켜 거리를 좁힌다
        
        
        
    
    
    return answer
