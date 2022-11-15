from collections import * 
from itertools import * 

def solution(record):
    uids = {}
    result = []
    order = []
    for input in record:
        conv = input.split()
        state = conv[0]
        if(state == "Leave"):
            uid = conv[1]
            order.append([uid,"나갔습니다."])

        elif(state == "Enter"):
            uid = conv[1]
            name = conv[2]
            order.append([uid,"들어왔습니다."])
            uids[uid] = name
        
        else:
            uid = conv[1]
            name = conv[2]
            uids[uid] = name
        
      
        
    for uid,state in order:
        result.append(uids[uid] +"님이 " + state)

    
    
    return result