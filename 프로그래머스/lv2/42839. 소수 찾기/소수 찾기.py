from itertools import permutations
def solution(n):
    a = set()
    for i in range(len(n)):
        a |= set(map(int, map("".join, permutations(list(n), i + 1))))
        #모든 경우의 수를 합집합 하고 ,1~n길이까지 
    a -= set(range(0, 2)) # 0~2 까찌  차집합 하고
    
    # 에라토스테네스의 체 진행
    # 2~ a최댓값의 제곱근 까지 ,
    for i in range(2, int(max(a) ** 0.5) + 1):
        a -= set(range(i * 2, max(a) + 1, i) ) # i의 배수를 모두  차집합
    return len(a)