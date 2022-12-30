import Foundation

func gcd(_ b:Int ,_ a:Int ) ->Int {
    
    var b = b
    var a = a
    while(b != 0)
    {
        let tmp = b
        b = a % b
        a = tmp
    }

    return a
}


func solution(_ a:Int, _ b:Int) -> Int {
    
    
    let g = gcd(a,b)
    var b = b / g

    while(b != 0 && b != 1)
    {
    
        for i in (2...5)
        {
            
            
            if( b % i == 0 )
            {
                if(i == 3)
                {
                    b = 0
                    return 2
                }
                else
                {
                    b /= i
                    break
                }
            }
            else
            {
                if(i == 5)
                {
                    return 2
                }
            }
        }
    }
    
    
    return 1
}