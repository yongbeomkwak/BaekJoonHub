def solution(routes):
    answer = 0
    n = len(routes)
    routes.sort(key = lambda x: x[1])
    
    camera = -30001
    
    for route in routes:
        entry, exit = route
        if camera < entry:
            answer += 1
            camera = exit
            
    return answer
                
    