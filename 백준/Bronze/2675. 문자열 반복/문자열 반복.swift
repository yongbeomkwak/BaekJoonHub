//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation

let N = Int(readLine()!)!

for _ in 1...N{
    let input: [String] = readLine()!.split(separator:" ").map {String($0)}
    
    var ans:String = ""
    
    for c in input[1] {
        ans += String(repeating: c, count: Int(input[0])!)
    }
    
    print(ans)
}



