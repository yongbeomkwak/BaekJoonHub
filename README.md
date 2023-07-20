# BaekJoonHub

1.[queue(deque)](https://hellominchan.tistory.com/156)


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

for _ in range(n):
    board.append(list(map(int,stdin.readline()[:-1].split())))

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

a = ["banana", "banana", "banana", "banana", "banana", "banana", "banana","apple","apple","apple","grape","grape","grape" ]

counterA= Counter(a)
print(counterA)

# Counter({'banana': 7, 'apple': 3, 'grape': 3})

aKey = list(counterA)
print(aKey)
# 키 추출
# ['banana', 'apple', 'grape']

aValue = list(counterA.values())
print(aValue)
# 모든 value 추출
# [7, 3, 3]

commons = counterA.most_common(2)

print(commons)
# most_common(n) ->  value값을 기준으로 내림차순으로 n개 만큼 가져옴
# n을 생략 시 전부 추출
# [('banana', 7), ('apple', 3)]




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

~~~python
12. find 와 index

a = "123456789"
b = [1,2,3,4,5,6,7,8]


print(a.find("3")) # 2
print(b.index(1)) # 0

print(a.find("3",0,3)) # 2  (찾을 문자열,시작인덱스,끝 인덱스)  [시작,끝) 범위에서 찾음
print(b.index(2,0,2)) # 1   (찾을 값,시작인덱스,끝 인덱스)  [시작,끝) 범위에서 찾음

# 차이점 
# 2-1) find( )
#찾는 문자가 없는 경우에 -1을 출력한다.
#문자열을 찾을 수 있는 변수는 문자열만 사용이 가능하다.  리스트, 튜플, 딕셔너리 자료형에서는 find 함수를 사용할 수 없다. 만일 사용하게 되면 AttributeError 에러가 발생한다.
#2-2) index( )
#찾는 문자가 없는 경우에 ValueError 에러가 발생한다.
#문자열, 리스트, 튜플 자료형에서 사용 가능하고 딕셔너리 자료형에는 사용할 수 없어 AttributeError 에러가 발생한다.

~~~

~~~python
13. list 메소드

a = []

## 추가 및 삽입

1. append

a.append(1)
a.append([1,2,3])
# [1,[1,2,3]]

2. insert(a,b)로 사용되는데, 이는 a위치에 b요소를 삽입한다

a.insert(1,4)
# [1, 4, [1, 2, 3]]

--------------------------------------------------

## 추출 및 삭제

1. pop , pop(x) :  맨 끝 제거 또는 , x위치 제거 

a.pop(0)

# [4, [1, 2, 3]]

2. remove함수는 리스트에서 나오는 첫번째 특정 요소를 삭제하는 함수입니다.

즉, remove(x)는 리스트에서 첫번째로 등장하는 x라는 요소를 삭제하는 것입니다.

만약 요소가 리스트에 존재하지 않는다면 오류를 반환합니다.

a.remove([1,2,3])

# [4]

--------------------------------------------------

## 확장

extend함수는 원래의 리스트에 리스트를 더하는 함수입니다.

extend(x) 로써 사용하는데, 위의 함수들과 달리 extend는 리스트 자료형을 더해주는 것으로써, x라는 인자가 리스트 자료형이어야 합니다.
    
a.extend([4,5,6]



# [4, 4, 5, 6]

~~~

~~~python

14. 문자열관련 판별 함수 

1. isdecimal()
2. isdigit()
3. isnumeric()
4. isalpha()

a = '12345678'
print(a.isdigit()) True
print(a.isdecimal()) True
print(a.isnumeric()) True


a = '3²'
print(a.isdigit()) True
print(a.isdecimal()) False
print(a.isnumeric()) True

이것은 함수 차이인데 isdigit() 함수는 단일 글자가 '숫자' 모양으로 생겼으면 무조건 True를 반환하는 함수. 즉, 숫자처럼 생긴 '모든 글자'를 숫자로 친다.

그에 비해 isdecimal() 함수는 주어진 문자열이 int형으로 변환이 가능한지 알아내는 함수이기 때문에 특수문자 중 숫자모양을 숫자로 치지않는다.

isnumeric() 함수는 숫자값 표현에 해당하는 문자열까지 인정한다. 제곱근, 분수, 거듭제곱 형태의 특수문자 → True

~~~

~~~python
15. enumerate

arr = [2,2,4,6,5]


for i,n in enumerate(arr,-3): # (반복객체,시작인덱스)
    print(i,n)

-3 2
-2 2
-1 4
 0 6
 1 5


~~~

~~~python
16. class 및 비교 메소드

class Edge:

    
    def __init__(self,a,b,cost):
        self.a = a
        self.b = b
        self.cost = cost
        

    def __lt__(self, other): # x < y 를 판단하는 기준을 정의 (less than → lt)
        return self.cost < other.cost
    def __le__(self, other): # x ≤ y 를 판단하는 기준을 정의 (less than or equal to → le)
         return self.cost <= other.cost
    def __gt__(self, other): # x > y 를 판단하는 기준을 정의 (greater than → gt)
         return len(self) > len(other)
    def __ge__(self, other): # x ≥ y 를 판단하는 기준을 정의 (greater than or equal to → ge)
         return len(self) >= len(other)
    def __eq__(self, other): #  x == y 를 판단하는 기준을 정의 (equal to → eq)
         return len(self) == len(other)
    def __ne__(self, other):  x == y 를 판단하는 기준을 정의 (equal to → eq)
         return len(self) != len(other)
~~~

~~~python
17. string 및 진법 변한

a. n진수  → 10진수

print(int('444',5))
print(int('555',6))
print(int('FFF',16))

b. 10진수  → 2, 8, 16진수

2, 8, 16진수는 bin(), oct(), hex() 함수를 지원합니다.

print(bin(10))
print(oct(10))
print(hex(10))


c. n진수  → n진수

import string

tmp = string.digits+string.ascii_lowercase
def convert(num, base) :
    q, r = divmod(num, base)
    if q == 0 :
        return tmp[r] 
    else :
        return convert(q, base) + tmp[r]


print(convert(int('a',16),2))
print(convert(int('4',5),3))
print(convert(int('2',3),4))
print(convert(int('11',2),5))

~~~



