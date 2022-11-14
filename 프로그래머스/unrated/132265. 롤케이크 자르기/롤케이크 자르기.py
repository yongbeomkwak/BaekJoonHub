from collections import Counter

def solution(topping):
    answer = 0
    TP = Counter(topping)	# 토핑의 갯수 사전
    check = set()
    for i in topping:
        TP[i] -= 1
        check.add(i)
        if TP[i] == 0:		# 토핑 갯수 0이면 삭제
            TP.pop(i)
        if len(TP) == len(check):	# 종류수 같다면 +1
            answer += 1
            
    return answer