def solution(array):
    answer = 0
    
    array.sort()
    
    cnt = len(array)
    
    return array[cnt//2] 