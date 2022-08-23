//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation


let N = Int(readLine()!)!


for _ in 1...N{
    let input = readLine()!.components(separatedBy: " ")
    print(Int(input[0])! + Int(input[1])!)
}

