import Foundation

func solution(_ quiz:[String]) -> [String] {
    
    var ans:[String] = []
   
    for q in quiz{
        if(q.contains("+"))
        {
            let tmp = q.components(separatedBy:" ")
            if(Int(tmp[0])! + Int(tmp[2])! == Int(tmp[4])!)
            {
                ans.append("O")
                continue
            }
            ans.append("X")
            
        }
        else
        {
            let tmp = q.components(separatedBy:" ")
            if(Int(tmp[0])! - Int(tmp[2])! == Int(tmp[4])!)
            {
                ans.append("O")
                continue
            }
            ans.append("X")
        }
    }
    
        
    
    return ans
}