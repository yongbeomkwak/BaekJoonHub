from sys import *

s = stdin.readline()[:-1]

tmp = []
result = ""
lock = False

def emit(tmp:list) -> str :
    ret = ""
    while tmp:
        ret += tmp.pop()
        
    return ret
    



for c in s :
    if c == "<":
        
        result += emit(tmp)
        lock = True
        result += c
        continue
        
    elif c== ">":
        lock = False
        result += c
        continue
    
    if lock:
        result += c
        
    else:
        if c == " ":
            result += emit(tmp)
            result += " "
        
        else: 
            tmp += c
        
    
            

result += emit(tmp)

print(result)
    
    
    




