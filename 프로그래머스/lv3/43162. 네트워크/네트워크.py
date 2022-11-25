
def union(a,b,l):
    pa = find(a,l)
    pb = find(b,l)
    
    if(pa<=pb):
        l[pb] = pa
    else:
        l[pa] = pb

def find(a,p):
    r = p[a]
    
    while(p[r]!=r):
        r = p[r]
        
    
    tmp = a
    
    while(tmp!=p[tmp]):
        pa = p[tmp]
        p[tmp] = r
        tmp = pa
    
    return r
        
def solution(n, computers):
    l = [i for i in range(n+1)]
    
    for i in range(n):
        for j in range(n):
            if i==j:
                continue
            if(computers[i][j] == 1):
                union(i+1,j+1,l)
    
        
        for i in range(n):
            l[i] = find(i,l)
    
    return len(set(l[1:])) 