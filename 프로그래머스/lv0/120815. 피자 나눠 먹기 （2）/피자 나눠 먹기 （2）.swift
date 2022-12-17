import Foundation

let gcd: (Int,Int) -> Int = { (a: Int, b: Int) in
    
    var m = a
    var n = b                   
    if(m<n){
      let tmp = n
        n = m
        m = tmp
    }
    
    while(n>0)
    {
       let tmp = n
        n = m % n
        m = tmp
    }
                             
    return m
}

let lcm: (Int,Int) -> Int = { (a: Int, b: Int) in
    
    return (a*b) / gcd(a,b)
                             
}

func solution(_ n:Int) -> Int {
 
    return lcm(6,n) / 6
}