import Foundation

func solution(_ chicken:Int) -> Int {
    
    var ans:Int = chicken / 10
    var coupon =  chicken / 10 + chicken % 10
    while(coupon > 9 )
    {
        let service:Int  = coupon / 10
        ans += service
        coupon = service + coupon % 10 
    }
    
    
    
    return ans
}