from itertools import *

def solution(elements):

    answer = 0
    s = set()
    l = len(elements)
    elements = elements * 2
    
    for ll in range(1,l+1):
        for begin in range(0,l):
            s.add(sum(elements[begin:begin+ll]))
    
    return len(s)