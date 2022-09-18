//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 2022/08/23.
//

import Foundation

var ans:Int = 1000001

var n = Int(readLine()!)!


for i in (1..<1000001)
{
    var now:Int = i
    
    let str = String(i)
    
    
        for c in str
        {
            now += Int(String(c))!
        }
    
    
    if(n == now)
    {
        ans = min(ans,i)
        break
    }
}

if(ans != 1000001)
{
    print(ans)
}
else
{
    print(0)
}


