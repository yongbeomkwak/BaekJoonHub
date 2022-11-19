answer = 0 
visit = []
def dfs(nowK,clear,d):
    global answer
    l = len(d)
  
    
    
    for i in range(l):
        need = d[i][0]
        consume = d[i][1]
        if(visit[i] or nowK-need <0):
            continue
        visit[i] = True
        dfs(nowK-consume,clear+1,d)
        visit[i] = False
        
    answer = max(answer,clear)

def solution(k, d):
    global visit
    
    visit = [False for _ in range(len(d))]
    
    dfs(k,0,d)
    
    return answer