from heapq import *

def solution(scoville, K):
    
    heap = scoville
    answer = 0
    
    heapify(heap)
    
    
    while len(heap) >= 2 and heap[0] < K:
        a = heappop(heap)
        b = heappop(heap)
        
        heappush(heap,a+b*2)
        answer += 1
    
    if heap[0] < K:
        return -1
    
    return answer