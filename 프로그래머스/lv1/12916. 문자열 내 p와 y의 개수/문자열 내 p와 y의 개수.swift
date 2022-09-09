import Foundation

func solution(_ s:String) -> Bool
{
    var upp = s.uppercased()
    var cntP:Int = 0 
    var cntY:Int = 0
    
    for s in upp{
        let ss = String(s)
        if(ss=="P")
        {
            cntP += 1 
        }
        if(ss=="Y")
        {
            cntY += 1
        }
    }
    
    return cntP == cntY ? true : false
}