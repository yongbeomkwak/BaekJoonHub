class Job(object):
    def __init__(self, begin=0, cost=0):
        self.begin = begin
        self.cost = cost

    def __lt__(self, other):  # less then
        return self.cost < other.cost

    def __le__(self, other): # less then or equeal
        return self.cost <= other.cost

from heapq import *
    
def solution(jobs):
    jobs.sort(key = lambda item: item[0]) #시작 시간으로 일단 전체 정렬을 한후 
    tmp =  list(map(lambda item: Job(item[0],item[1]),jobs)) #Job객체로 맵핑
    answer = 0
    task = 0 #현재 작업을 가르키는 인덱스
    l = len(jobs) # 작업 갯수
    time = 0 #현재 시간
    heap = []
   
    while heap or task < l : # 힙이 비어있거나 모든 작업을 수행하면 탈출
        
        if  task < l and time >= tmp[task].begin: #현재 시간 >= 작업시작시간 
            heappush(heap,tmp[task]) # 작업 넣어줌 
            task += 1 # 다음 작업
            continue
        
        if heap : #작업 큐에 있을 때
            now_job  = heappop(heap)
            answer += (time-now_job.begin+now_job.cost)
            # 대기 시간 = 시작시간 - 요청시간
            # 걸린 시간 = (시작시간 - 요청시간 + 작업시간)
            # 걸린 시간 = (대기시간 + 작업시간)
            time += now_job.cost # 작업시간 만큼 이동 
        else : # 만약 현재 큐가 비어잇다면 
           time = tmp[task].begin # 다음 작업의 시간으로 바로 이동
       

    
    
    
    return answer//l
