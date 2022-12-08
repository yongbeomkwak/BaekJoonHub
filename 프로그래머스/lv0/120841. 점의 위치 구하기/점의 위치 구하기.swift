import Foundation

func solution(_ dot:[Int]) -> Int {

    var ans = 0 
    if(dot[0] > 0 && dot[1] > 0)
    {
        ans = 1
    }
    else if(dot[0] > 0 && dot[1] < 0)
    {
        ans = 4
    }
    else if(dot[0] < 0 && dot [1] < 0)
    {
        ans = 3
    }
    else
    {
        ans = 2
    }
    

    return ans
    
}