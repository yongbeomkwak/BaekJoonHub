//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation

let input = Array(readLine()!)


var a = Set<String>()


for i in (0..<input.count)
{
    var str:String = ""
    for j in (i..<input.count)
    {
        let index = input.index(input.startIndex, offsetBy: j)
        str += String(input[index])
        a.insert(str)
    }
}

print(a.count)
