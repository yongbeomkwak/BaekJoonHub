//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation


struct Queue<T> {
    var input = [T]() //👉 입력용 큐 (원래 큐의 순서대로 데이터가 존재)
    var output = [T]() //👉 출력용 큐 (원래 큐의 반대 순서로 데이터가 존재)
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        return input.count + output.count
    }
    
    
    // 큐에 데이터 넣기
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    // 큐에서 데이터 빼기
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed() //👉 시간복잡도 O(1)
            input.removeAll() //❗️ 시간복잡도 O(n), n의 input의 길이
        }
        return output.popLast()!
    }
    
    
}



let n = Int(readLine()!)!

var queue = Queue<Int>()

for i in (1...n)
{
    queue.enqueue(i)
}

while(queue.count != 1)
{
    queue.dequeue() // 위에꺼 빼고
    queue.enqueue(queue.dequeue()) //뒤에로 옮기고
}


print(queue.dequeue())





