def solution(nums):
    answer = 0
    kinds = len(set(nums))
    l = len(nums) // 2
    
    if kinds <= l :
        answer = kinds
    else:
        answer = l

    
    
    return answer