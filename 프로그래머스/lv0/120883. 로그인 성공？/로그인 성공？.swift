import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    let log:String = "login"
    let fail:String = "fail"
    let wpw:String = "wrong pw"
    var f1:Bool = false
    var f2:Bool = false
    
    for acc in db{
        if(acc[0] == id_pw[0])
        {
            f1 = true
            if(acc[1] == id_pw[1])
            {
                f2 = true;
            }
        }
        
    }
    var ans = ""
    
    if(f1 && f2)
    {
        return log
    }
    else if (f1)
    {
        return wpw
    }
    else
    {
        return fail
    }
    
    

}