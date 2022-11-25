from collections import * 
def solution(maps):
    n = len(maps) 
    m = len(maps[0]) 
    visit = [[False for _ in range(m)] for _ in range(n)]
    record = [[0 for _ in range(m)] for _ in range(n)]

    n -= 1
    m -= 1
    dx = [0,0,1,-1]
    dy = [1,-1,0,0]

    record[0][0] = 1
    visit[0][0] = True
    q = deque()
    q.append((0,0))

    while q:
        nowY,nowX = q.popleft()

        for i in range(4):
            nextY = nowY + dy[i]
            nextX = nowX + dx[i]

            if(nextY>n or nextX >m or nextY<0 or nextX <0):
                continue

            if(maps[nextY][nextX] == 0):
                continue
            if(visit[nextY][nextX]):
                continue

            record[nextY][nextX] = record[nowY][nowX] +1 
            visit[nextY][nextX] = True
            q.append((nextY,nextX))



    if(not(visit[n][m])):
        return -1 

    return record[n][m]