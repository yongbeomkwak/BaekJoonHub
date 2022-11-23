from itertools import product
def solution(numbers, target):
    l = [(x, -x) for x in numbers]
   # print(l)
    s = list(map(sum, product(*l)))
 #   print(s)
    return s.count(target)