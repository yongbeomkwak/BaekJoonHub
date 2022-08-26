//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation


let input = Int(readLine()!)!

var array:[Int] = [Int]()

for _ in 0..<input{
    array.append(Int(readLine()!)!)
}

array.sort()

for i in array{
    print(i)
}
















