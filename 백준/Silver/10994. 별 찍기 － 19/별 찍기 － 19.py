from sys import *

limit_number = 15000
setrecursionlimit(limit_number)

n = int(input())

arr_len = 4 * n - 3

board = [[" "] * arr_len for _ in range(arr_len)]


def draw_start(n:int,x:int,y:int):
    
    if n == 1:
        board[y][x] = "*"
        return
    
    curr_len = 4 * n - 3
    
    
    for i in range(curr_len):
        board[y][x+i] = "*" # 왼쪽 위에서 오른쪽
        board[y+i][x] = "*" # 왼쪽 위에서 아래로
        board[y + curr_len - 1][x + i] ="*" # 왼쪽 아래에서 오른쪽으로
        board[y + i][x + curr_len -1] = "*" # 오른쪽 위에서 아래로 
        
    
    draw_start(n-1,x+2,y+2) # 시작점 우하단으로 2 옮김
        
    
    


draw_start(n,0,0)

for star in board:
    print("".join(star))
    
