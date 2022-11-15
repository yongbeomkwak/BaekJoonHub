def solution(elements):
    answer = 0
    l = len(elements)
    elements *= 2
    ss = set()

    
    for i in range(1,l+1):
        for s in range(l):
            ss.add(sum(elements[s:s+i]))
    
    
    return len(ss)