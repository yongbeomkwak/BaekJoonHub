from sys import *
from collections import * 


n = int(stdin.readline()[:-1])
k = int(stdin.readline()[:-1])

board = [[0 for _ in range(n+1)] for _ in range(n+1) ]

for _ in range(k):
  h,v =  map(int,stdin.readline()[:-1].split())
  board[h][v] = 2

l = int(stdin.readline()[:-1])

q = deque()

for _ in range(l):
  q.append(stdin.readline()[:-1].split())

t = 0
dir = [(0,1),(1,0),(0,-1),(-1,0)]

snake = deque()
board[1][1] = 1
snake.append((1,1))
curr_dir = 0
while True:
    t += 1
    
   
    now = snake[-1]
    next_y = now[0] + dir[curr_dir][0]
    next_x = now[1] + dir[curr_dir][1]

    
    if (next_x > n or next_y > n or next_x < 1 or next_y < 1  or board[next_y][next_x] == 1):
        break
    
    
    
    snake.append((next_y,next_x))
    if board[next_y][next_x] == 0:
        (y,x) = snake.popleft()
        board[y][x] = 0
    
    board[next_y][next_x] = 1   
    

    if q and int(q[0][0]) == t:
        
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
     