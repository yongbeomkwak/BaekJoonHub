import Foundation

func solution(_ my_string:String) -> Int {
    
    var now:Int = 0
    var tmp:String = ""
    var oper = "+"
    
    
    for s in my_string.split(separator:" ")
    {
        if(s == "+" || s == "-" )
        {
            if(oper == "+")
            {
                now += Int(tmp)!
            }
            else
            {
                now -= Int(tmp)!
            }
            oper = String(s)
            tmp = ""
        }
        else
        {
            tmp += String(s)
        }
    }
    
    if(oper == "-")
    {
        now -= Int(tmp)!
    }
    else
    {
        now += Int(tmp)!
    }
   
    return now
}