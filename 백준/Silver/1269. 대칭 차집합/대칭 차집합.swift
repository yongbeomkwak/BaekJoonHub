//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").map({Int($0)!})


 

let setA = Set(readLine()!.components(separatedBy: " ").map({Int($0)!}))
var setB = Set(readLine()!.components(separatedBy: " ").map({Int($0)!}))
print(setA.symmetricDifference(setB).count)

