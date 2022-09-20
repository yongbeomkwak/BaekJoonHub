//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").map({Int($0)!})

var hash:[String:Bool] = [:]


var setA = Set<String>()
 
for _ in (0..<input[0])
{
    let str = readLine()!
    
    setA.insert(str)
}

var setB = Set<String>()

for _ in (0..<input[1])
{
    let str = readLine()!
    
    setB.insert(str)
    
}
let setC = setB.intersection(setA).sorted()
print("\(setC.count)")

for s in setC{
    print(s)
}

