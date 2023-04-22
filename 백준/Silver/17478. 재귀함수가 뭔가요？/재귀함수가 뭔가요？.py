output = ['"재귀함수가 뭔가요?"','"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.',"마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.",'그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어."',"라고 답변하였지."]
answer = ['"재귀함수가 뭔가요?"','"재귀함수는 자기 자신을 호출하는 함수라네"',"라고 답변하였지."]

n = int(input())

from sys import *

l = len(output)
result = "어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.\n"

def rec(_n:int,i:int):
    global result
    
    if n == _n: # 교수님 답변 차례
        for ans in answer:
            result += ("____" * _n) + ans +"\n"
        return
    
    
    result += ("____" * (_n) + output[i] + "\n")
    if i == l - 2: #물었어 까지
        rec(_n+1,0)
        result += ("____" * (_n) + output[l-1] + "\n") #라고 답변하였지
        
        
    else:
        rec(_n,i+1)
    

rec(0,0)    

stdout.write(f"{result[:-1]}")

    
    
