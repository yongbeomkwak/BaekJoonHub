//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation

var input = readLine()!

let croatia = ["c=","c-","dz=","d-","lj","nj","s=","z="]




croatia.forEach { str in
    input = input.replacingOccurrences(of: str, with: "#")
}

print(input.count)






