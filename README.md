# BaekJoonHub

1.[queue(deque)](https://www.daleseo.com/python-queue/)


2.[heap](https://www.daleseo.com/python-heapq/)

3.[[::]연산자](https://blog.wonkyunglee.io/3)
~~~python
>> arr = range(10)
>> arr
[0,1,2,3,4,5,6,7,8,9]
>> arr[::2] # 처음부터 끝까지 두 칸 간격으로
[0,2,4,6,8]
>> arr[1::2] # index 1 부터 끝까지 두 칸 간격으로
[1,3,5,7,9]
>> arr[::-1] # 처음부터 끝까지 -1칸 간격으로 ( == 역순으로)
[9,8,7,6,5,4,3,2,1,0]
>> arr[::-2] # 처음부터 끝까지 -2칸 간격으로 ( == 역순, 두 칸 간격으로)
[9,7,5,3,1]
>> arr[3::-1] # index 3 부터 끝까지 -1칸 간격으로 ( == 역순으로)
[3,2,1,0]
>> arr[1:6:2] # index 1 부터 index 6 까지 두 칸 간격으로
[1,3,5]

~~~
~~~python
4. 2차원 배열 초기화


arr = [[0 for j in range(cols)] for i in range(rows)]

gmap = [list(map(int, stdin.readline()[:-1])) for _ in range(n)] 

~~~
~~~python
5. deque와 print(*a)


백준 Sliver 2641 참고

deque는 roate라는 함수가 있는데 dq.rotate(n)

n이 양수면 n만큼 오른쪽 회전
n이 음수면 n만큼 왼쪽으로 회전 

answer =[[1,2,3,4],[5,6,7,8]]
    
    for ans in answer:
        print(*ans)
    
    결과
    1 2 3 4
    5 6 7 8
     
~~~
~~~python
6. divmod(n,d)

몫과 나머지를 한번에 튜플 형태로 리턴

몫,나머지 = divmod(n,d)

~~~
~~~python
7. from itertools import *

순열과 조합

a = [1,2,3]
permute = permutations(a,2)
print(list(permute))

결과
[(1,2),(1,3),(2,1),(2,3),(3,1),(3,2)]

a = [1,2,3]
combi = combinations(a,2)
    
print(list(combi))
결과
[(1,2),(1,3),(2,3)]


~~~

~~~python
8. from collections import Counter

리스트를 인자 값으로 받아 갯수를 dictionary 형태로 리턴

a = ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]

print(a)

{"banana":10}

~~~

~~~python
9.  from functools import *

고차함수를 쓸 수 있도록 도와주는 모듈

ex) reduce(lambd 식 ,반복 객체, 초기값)

l = [1,2,3,4,5]

k = reduce(lambda x, y: x*(y+1), l, 1) - 1 , -> 초기값 1 * (l의 모든 원소를 +1하여 누적곱을 진행 후 -1

print(2*3*4*5*6-1)   
print(k)
~~~
~~~python
10. any와 all 함수와 for 문을 통한 조건 검증

형식: any or all ( 조건 i  for i in list)

a = 10
l = [1,2,4,11,5]


print(any( a > i for i in l)) # 10보다 하나라도 큰게 있으므로 True
print(all( a > i for i in l)) # 모두 10보다 큰게 아니므로 False


~~~
