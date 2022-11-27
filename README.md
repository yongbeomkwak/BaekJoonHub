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

a. 순열과 조합

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


b. cycle: 무한순환 
next 함수를 이용해 한칸 이동

a = [1,2,3]

ca = cycle(a)
for _ in range(10):
    print(next(ca))
# 결과 
# 123 123 123 1 ,여백은 구분하기 위해 넣어논 것 


c. product: 데카르트 곱

product(iterator1, iterator2, .. , [repeat=1])

A X B의 모든 경우의 수를 보여준다.

A = [1,2,3]
B = [4,5,6]

print(list(product(A,repeat = 2)))
A X A 
[(1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3)]
print(list(product(A,B)))
A X B
[(1, 4), (1, 5), (1, 6), (2, 4), (2, 5), (2, 6), (3, 4), (3, 5), (3, 6)]
print(list(product(A,B,repeat = 2)))
(A X B) X (A X B)
[(1, 4, 1, 4), (1, 4, 1, 5), (1, 4, 1, 6), ...)]



~~~

~~~python
8. from collections import *

a. Counter 리스트를 인자 값으로 받아 갯수를 dictionary 형태로 리턴

a = ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]

print(Counter(a))

{"banana":10}

b.defaultdict  기본 타입을 지정한 딕셔너리, 지정하는 타입마다 default 타입이 달라짐

ex1 = defaultdict(int) # int로  지정시 default 값은 0

print(ex1[0]) 
0

ex2 = defaultdict(list) # list로 지정시 default 값은 비어있는 리스트 []
print(ex2[0])
[]


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

~~~python
11. sum 함수를 이용한 중첩 list 벗기기와 이중 튜플 min ,max 함수 이용


sizes = [[-3,10000],[-1,50],[0,3],[4,5]]

s = sum(sizes, []) 

print(s) 
print(max(sizes))
print(min(sizes))

[-3, 10000, -1, 50, 0, 3, 4, 5]  #모두 벗겨서 하나로 헙쳐짐
[4, 5] # [0]번 째 인덱스가 큰걸로 인식, 같다면 [1]번 째 인덱스 비교
[-3, 10000] # 마찬가지로 [0]번째 인덱스 값이 가장 작은 값으로 인식


~~~
