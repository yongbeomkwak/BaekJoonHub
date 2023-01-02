import Foundation

func solution(_ n:Int) -> Int {
    
    
    var now:Int = 1
    var prev:Int = 1
    while(now != n )
    {
        if(prev % 3 == 0 || String(prev).contains("3") )
        {
            prev += 1
            continue
        }
        else
        {
            prev += 1
            now += 1
            
        }
    }
    
    
    while((prev % 3) == 0 || (String(prev).contains("3")))
    {
        prev += 1
    }
    

    
    return prev
}