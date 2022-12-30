import Foundation

func solution(_ dots:[[Int]]) -> Int {
    
    var x1 = -1
    var x2 = -1
    var y1 = -1
    var y2 = -1
    
    for dot in dots{
        if(x1 == -1)
        {
            x1 = dot[0]
            y1 = dot[1]
            continue
        }
        if(x1 != dot[0] && y1 != dot[1] )
        {
            x2 = dot[0]
            y2 = dot[1]
        }
    }
    
    let w = x1 >= x2 ? x1 - x2 : x2 - x1
    let h = y1 >= y2 ? y1 - y2 : y2 - y1
    
    
    
    return w*h
}