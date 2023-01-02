import Foundation

func solution(_ poly:String) -> String {
    
    var a:Int = 0
    var b:Int = 0
    print()
    for s in poly.components(separatedBy:" ")
    {
        if(s == "+")
        {
            continue
        }
        else
        {
            let convS = String(s)
            if(convS.contains("x"))
            {
              
               var n = 1
               if let check = Int(convS.components(separatedBy:"x")[0]) {

                    n = check
               }
                a += n
              
            }
             else
            {
                b += Int(convS)!
            }
           
        }
    }
    
    if(a != 0 && b != 0 )
    {
        let ans = a == 1 ? "x" + " + \(b)": "\(a)x" + " + \(b)"
        return ans
    }
    if(a == 0 && b != 0)
    {
        return "\(b)"
    }
    if(a != 0 && b == 0)
    {
       return  a == 1 ? "x" : "\(a)x" 
    }
    return ""
     
    
    

}