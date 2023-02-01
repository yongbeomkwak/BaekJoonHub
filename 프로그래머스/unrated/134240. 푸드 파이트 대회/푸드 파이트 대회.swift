import Foundation

func solution(_ food:[Int]) -> String {
    
    let conv = food.map{$0/2}
    var res:String = ""
    
    for i in (0..<conv.count)
    {
        if(i == 0)
        {
            continue
        }
        for _ in (0..<conv[i])
        {
            res += String(i)
        }
    }
    
    let tmp:String = String(res.reversed())
    res += "0"
    res += tmp
    
    
    
    return res
}