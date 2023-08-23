from sys import *
from collections import * 
from heapq import * 
from functools import *
from math import *
from itertools import *
import string

def timeToMin(s):
    hour,minute = map(int,s.split(":"))
    
    return  hour * 60 + minute


def solution(fees, records):
    
    
    defaultMin,defaultCost,unitMin,unitCost = fees
    
    _hash = defaultdict(int)  # 시간 : 입차 시간
    _index = defaultdict(int) # 시간 : index
    
    total_time = [] # 누적시간 
    answer = []
    
    for i,record in enumerate(records):
        time,car,state = record.split(" ")
        
        if state == "IN":
            if not(car in _index): # 처음 들어온 차면
                _index[car] = len(total_time) # 해당 차에대한 누저시간 인덱스를 맵핑
                total_time.append(0) # 해당 차에댄한 누적시간 생성 
            
            _hash[car] = timeToMin(time) # 입차 시간 저장
            
        else:
            total_time[_index[car]] += timeToMin(time) - _hash[car] # 현재시간 - 입차 시간
            del _hash[car] # 해당 차 지움
    
    
    for key,val in _hash.items(): # 남아있는 차는 23:39분 기준 출고 
        total_time[_index[key]] += timeToMin("23:59") - _hash[key]
    
   
    
    for key in sorted(_index.keys()): # 차량번호를 기준으로 오름 차순 
        totalMin =  total_time[_index[key]] # 누적시간 
        
        if totalMin <= defaultMin:
            answer.append(defaultCost)
        
        else:
            answer.append(defaultCost + int(ceil((totalMin - defaultMin)  / unitMin)) * unitCost) # 기본시간보다 크면 , 올림 처리 

            

        
         
        
    
    return answer