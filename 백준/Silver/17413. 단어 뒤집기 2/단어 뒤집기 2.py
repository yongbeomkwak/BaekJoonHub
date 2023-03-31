from sys import *

s = stdin.readline()[:-1]

tmp = [] # 스택으로 사용할 list
result = ""
lock = False # 태그가 열려있는지를 확인할 플래그 변수 

def emit(tmp:list) -> str : # 스택의 모든 저장값 방출 함수
    ret = ""
    while tmp:
        ret += tmp.pop()
        
    return ret
    

'''
스택 방출 조건
1. 태그가 열릴 때
2. 태그가 열리지 않은 상태에서 공백이 나올 때 (단어가 구분될 때)



'''


for c in s :
    if c == "<": #  태그가 열림
        
        result += emit(tmp) # 스택 방출
        lock = True # 잠금
        result += c 
        continue
        
    elif c== ">":
        lock = False # 잠금 해제
        result += c
        continue
    
    if lock:  # 잠금 상태는 그대로 
        result += c
        
    else: 
        # 잠금이 아니면서 여백이 나올 때 , 스택 방출 후 , 공백 삽입
        if c == " ":
            result += emit(tmp)
            result += " "
        
        # 잠금과 여백이 아니면 , 뒤집기 위해 스택에 삽입
        else: 
            tmp += c
        
    
            

result += emit(tmp) # 스택에 담겨 있을 수 있는 마지막 단어 방출

print(result)
    
    
    




