//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation




let input = readLine()?.split(separator: " ").compactMap({Int($0)})


let n = input![0]
let m = input![1]

var cards:[Int]


cards = (readLine()?.split(separator: " ").compactMap({Int($0)}))!

var answer:Int = 0

for i in (0..<n-2)
{
    for j in (i+1..<n-1)
    {
        for k in (j+1..<n)
        {
            let now:Int = cards[i] + cards[j] + cards[k]
            if(now<=m)
            {
                answer = max(answer,now)
            }
        }
    }
}
print(answer)
