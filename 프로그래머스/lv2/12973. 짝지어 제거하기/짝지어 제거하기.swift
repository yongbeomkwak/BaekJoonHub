import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var stack = [String]()
    
    
    for c in s{
        let sc = String(c)
        if(stack.isEmpty)
        {
            stack.append(sc)
            continue
        }
        else
        {
            if(stack.last! == sc)
            {
                stack.popLast()
            }
            else
            {
                stack.append(sc)
            }
        }
    }

    return stack.isEmpty ? 1 : 0
}