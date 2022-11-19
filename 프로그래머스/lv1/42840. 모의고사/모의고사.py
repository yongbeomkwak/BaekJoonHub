def solution(answers):
    a = [1,2,3,4,5]
    b = [2,1,2,3,2,4,2,5]
    c = [3,3,1,1,2,2,4,4,5,5]
    answer = []
    l = len(answers)
    la = len(a)
    lb = len(b)
    lc = len(c)
    scoreA = 0
    scoreB = 0
    scoreC = 0
    try:
        for i in range(l):
            scoreA = scoreA+1 if answers[i] == a[i%la] else scoreA
            scoreB = scoreB+1 if answers[i] == b[i%lb] else scoreB
            scoreC = scoreC+1 if answers[i] == c[i%lc] else scoreC
    
    except e:
        pass
    
    res = [scoreA,scoreB,scoreC]
    
    for i  in range(3):
        if(max(res) == res[i]):
            answer.append(i+1)
    
    
    
    return answer