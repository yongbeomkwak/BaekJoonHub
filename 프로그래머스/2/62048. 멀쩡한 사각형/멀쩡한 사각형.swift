import Foundation

/// 최대공약수
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    
    var loop = gcd(w,h) // 반복 횟수
    
    var (w,h) = (max(w,h),min(w,h))
    
    var cutted_w = w/loop
    var cutted_h = h/loop 
    
    //각 w와 h를 반복횟수로 나눠 가장 작은 패턴을 찾음
    // cut = 작은 패턴에서 쓸 수 있는 사각 형 개수
    
    let cut = ( (cutted_w * cutted_h) - (cutted_w - 1) * (cutted_h - 1) )
    
    return  Int64((w*h) - (loop * cut))
}