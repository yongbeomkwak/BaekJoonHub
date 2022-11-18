class Job(object):
    def __init__(self, begin=0, cost=0):
        self.begin = begin
        self.cost = cost

    def __lt__(self, other):
        return self.cost < other.cost

    def __le__(self, other):
        return self.cost <= other.cost

from heapq import *
    
def solution(jobs):
    jobs.sort(key = lambda item: item[0])
    answer = 0
    task = 0
    tmp =  list(map(lambda item: Job(item[0],item[1]),jobs))
    l = len(jobs)
    time = 0
    heap = []
   
    while heap or task < l :
        if  task < l and time >= tmp[task].begin:
            heappush(heap,tmp[task])
            task += 1
            continue
        
        if heap :
            now_job  = heappop(heap)
            answer += (time-now_job.begin+now_job.cost)
            time += now_job.cost
        
        else :
           time = tmp[task].begin
       

    
    
    
    return answer//l