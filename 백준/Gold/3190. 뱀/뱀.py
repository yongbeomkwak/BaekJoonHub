from sys import *
from collections import * 


n = int(stdin.readline()[:-1])
k = int(stdin.readline()[:-1])

board = [[0 for _ in range(n+1)] for _ in range(n+1) ] # 0 = 빈 공간, 1 = 현재 뱀이 차지하는, 2 = 사과

for _ in range(k):
  h,v =  map(int,stdin.readline()[:-1].split()) 
  board[h][v] = 2 # 사과 2로 표시

l = int(stdin.readline()[:-1])

q = deque() # 방향 전환을 담는 큐

for _ in range(l):
  q.append(stdin.readline()[:-1].split())



snake = deque() # 뱀의 역할을 하는 queue
board[1][1] = 1  # 첫 뱀위치
snake.append((1,1)) # ""

t = 0 # 시간
dir = [(0,1),(1,0),(0,-1),(-1,0)] # 인덱스 증가(오른쪽 90도), 인덱스 감소(왼쪽 90도)
curr_dir = 0 #현재 
while True:
    t += 1
    
   
    now = snake[-1] # 현재 뱀의 머리 위치 
    next_y = now[0] + dir[curr_dir][0]
    next_x = now[1] + dir[curr_dir][1]

    # 다음 위치를 계산 후
    
    #탈출 조건을 검증한다
    # 조건1: 벽과의 충돌 (next_x > n, next_y > n) or (next_x < 1, next_y < 1)
    # 조건2: 뱀의 몸통과 충돌 board[next_y][next_x] == 1
    if (next_x > n or next_y > n or next_x < 1 or next_y < 1  or board[next_y][next_x] == 1):
        break
    
    #탈출 조건에 걸리지 않을 경우 새로운 뱀의 머리를 넣어 준다. (다음 위치로 뱀의 버리 이동)
    snake.append((next_y,next_x))
    
    if board[next_y][next_x] == 0: # 만약 사과가 없으면 , 꼬리를 제거한다.
        (y,x) = snake.popleft()
        board[y][x] = 0 # 꼬리를 제거하므로 다시 0으로
    
    board[next_y][next_x] = 1   
    

    if q and int(q[0][0]) == t: #현재 시간이 방향 전환 시간과 같으면 계산을 통해 , 다음 이동의 방향을 바꾼다.
        
        oper =  q.popleft()[1]
     
        if oper == "L":
            if curr_dir == 0: 
                curr_dir = 3
            else :
                curr_dir -= 1
        
        else :
            if curr_dir == 3:
                curr_dir = 0
            
            else:
                curr_dir += 1

print(t)
     
