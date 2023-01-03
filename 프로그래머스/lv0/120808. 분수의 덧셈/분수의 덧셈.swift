import Foundation


func fgcd(_ n:Int,_ m:Int) -> Int
{
    var n:Int = n
    var m:Int = m
    while(n != 0)
    {
        let tmp = n
        n = m % n
        m = tmp
    }
    
    return m
    
}


func solution(_ denum1:Int, _ num1:Int, _ denum2:Int, _ num2:Int) -> [Int] {
    
    let gcd = fgcd(num1,num2)
    let lcm = (num1/gcd)  * (num2/gcd) * gcd
    
    let n1 = lcm/num1
    let n2 = lcm/num2
    let afterDenum = (denum1 * n1) + (denum2 * n2)
    let gcd2 = fgcd(afterDenum,lcm)
    print(gcd2)
    
    
    return [afterDenum/gcd2,lcm/gcd2]
}