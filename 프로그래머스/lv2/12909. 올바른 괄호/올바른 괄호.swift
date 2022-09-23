import Foundation

func solution(_ s:String) -> Bool
{
    var stack:[String] = [String]()
    
    
    for c in s{
        if(c=="(")
        {
            stack.append(String(c))
        }
        else
        {
            if(stack.isEmpty)
            {
                stack.append(String(c))
                break
            }
            else
            {
                stack.popLast()!
            }
        }
    }
    
    return stack.isEmpty
}