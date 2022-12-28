import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {
    
    var tmp:String = ""
    var res:[String] = []
    for c in my_str {
        if(tmp.count < n)
        {
            tmp += String(c)
        }
        if (tmp.count == n)
        {
            res.append(tmp)
            tmp = ""
        }
    }
    if(tmp.count != 0)
    {
        res.append(tmp)
    }
    
    
    return res
}