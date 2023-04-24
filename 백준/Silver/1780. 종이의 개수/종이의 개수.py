
from sys import *

limit_number = 15000
setrecursionlimit(limit_number)

n = int(input())

board = []

for _ in range(n):
    board.append(list(map(int,stdin.readline()[:-1].split())))

ans = [0,0,0]



def dfs(x:int,y:int,z:int):
    
    curr = board[y][x]
    
    
    for i in range(y,y+z):
        for j in range(x,x+z):
            if board[i][j] != curr: # 값이 같지 않으면
                # 9등분
                for k in range(3):
                    for l in range(3):
                        dfs(x + l * (z //3), y + k * (z //3), z //3)
                
                return # 9등분 후 리턴 
    
    # 여기까지 내려 왔다면 현재 모든 종이가 같은 값
    if curr == -1:
        ans[0] += 1
    elif curr == 0:
        ans[1] += 1
    else:
        ans[2] += 1
        
dfs(0,0,n)


stdout.write(f"{ans[0]}\n{ans[1]}\n{ans[2]}")
