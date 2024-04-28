def solution(phone_book):
    answer = True
    
    hash = {}
    
    for i in range(0,len(phone_book)):
        hash[phone_book[i]] = i 
        
    for i in range(len(phone_book)):
        for j in range(len(phone_book[i])):
        
            str = phone_book[i][:j]
            if str in hash and hash[str] != i:
                return False
    
    
    
    return answer