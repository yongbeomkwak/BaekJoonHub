def solution(nums):
    
    target = len(nums) // 2 
    hash = {}
    for po in nums:
        if len(hash) < target and po not in hash:
            hash[po] = 1 
    
    
 
    return len(hash)