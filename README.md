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


출처: https://blog.wonkyunglee.io/3 [Wonkyung's blog:티스토리]
~~~

