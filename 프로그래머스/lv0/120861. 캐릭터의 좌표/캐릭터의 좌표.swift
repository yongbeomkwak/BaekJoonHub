import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    
    var ans = [0,0]
    
    let hEnd = (board[0] - 1) / 2
    let vEnd = (board[1] - 1) / 2
    
    for s in keyinput{
        if(s == "left")
        {
            if(ans[0] != -hEnd )
            {
                ans[0] -= 1
            }
        }
        else if(s == "right")
        {
            if(ans[0] != hEnd )
            {
                ans[0] += 1
            }
        }
        else if(s == "up")
        {
            if(ans[1] != vEnd )
            {
                ans[1] += 1
            }
        }
        else
        {
            if(ans[1] != -vEnd )
            {
                ans[1] -= 1
            }
        }
    }
    
    
    return ans
}