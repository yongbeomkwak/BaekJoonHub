from heapq import * 



def solution(n, edge):
    adj = [[] for _ in range(n+1)]
    dist = [n for _ in range(n+1)]
    
    for l in edge:
        s,e, = l
        adj[s].append(e)
        adj[e].append(s)
    
    
    heap = []
    heappush(heap,(0,1))
    dist[1] = 0
    while heap:
        c,s = heappop(heap)
        
        
        for e in adj[s]:
            nowDist = c + 1
            if(nowDist<dist[e]):
                dist[e] = nowDist
                heappush(heap,(nowDist,e))
    
      
    
    return dist[1:].count(max(dist[1:]))