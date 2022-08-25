//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation


let N = Int(readLine()!)!


var ans:Int = 0

for _ in 1...N{
    var input = readLine()!
    var isGroup:Bool = true
    var group:[String] = [String]()
    for c in input{
        
        let str = String(c)
        
        if(group.contains(str)){ //이미 있고
            if(group.last != str) //가장 마지막에 추가 된게 아니라면
            {
                isGroup = false // 그룹단어 아님
                break
            }
        }
        else
        {
            group.append(str)
        }
    }
    if(isGroup)
    {
        ans+=1
    }
}

print(ans)
