from sys import *

s = list(stdin.readline()[:-1])
visit = [False for _  in range(len(s))] # 방문 체크


# curr = 현재 위치, n: 압축 길이
def decompress(curr:int,n:int) -> int :
    
    l = 0

    
    while curr < len(s):
        
        if(visit[curr]):
            curr += 1
            continue
        
        visit[curr] = True
        
        if s[curr] == "(": # 열리면 , 압축길이를 나타내는 숫자를 빼줌
            l -= 1
            cal = decompress(curr+1,int(s[curr-1])) # 곱할 수를 넘겨준다.
            l += cal # 결과 합쳐줌
            
        elif s[curr] == ")": # 닫히면 압축길이 * 압축한문자열 단위 길이
            return l * n
        
        else: # 모두 아닐경우 일반숫자
            l += 1
        
        curr += 1
        
    
    return l * n # 끝 도달 시 최종 계산 리턴


print(decompress(0,1))
