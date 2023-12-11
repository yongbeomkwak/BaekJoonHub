import Foundation

func solution(_ n:Int) -> Int 
{
    
    var distance = n, cost = 0
    
    while distance > 0 {
        if distance % 2 == 1 { // 홀수면 한칸 점프 , 짝수면 순간 이동 
            cost += 1
        }
        
        distance /= 2
    }
    
    return cost
    
    return String(n,radix:2).filter{$0 == "1"}.count // 점프 횟수는 이진법 변환 시 1의 개수와 같음
}