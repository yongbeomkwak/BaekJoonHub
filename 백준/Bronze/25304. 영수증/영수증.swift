//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation


var X = Int(readLine()!)!

let N = Int(readLine()!)!

for i in 1...N{
    let input = readLine()!.components(separatedBy: " ")
    
    X -= Int(input[0])! * Int(input[1])!
}

print(X == 0 ? "Yes" :"No")

