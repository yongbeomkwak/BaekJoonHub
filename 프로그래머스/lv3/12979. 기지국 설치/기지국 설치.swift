import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    
    var left:Int = 0
    let m = stations.count
    
    var dist:[Int] = []
    
    dist.append(stations[0] - w - 1) // 가장 왼쪽의 신호가 닿지 않는 영역 =   설치된 기지국 첫번째 왼쪽 범위 밖
    
    for i in 1..<m { 
        dist.append((stations[i]-w-1)-(stations[i-1]+w)) // 기지국 사이 신호 없는 범위 =  다음 기지국의 신호 없는 왼쪽 범위 - 이전 기지국 오른쪽 범위 끝 
    }
    
    dist.append(n - (stations[m-1] + w)) // 오른쪽 끝 신호 없는 영역 = n - 마지막 기지국 신호 오른쪽 범위 

    
    let coverage = 2*w + 1 
    
    for d in dist {
        
        if d <= 0 {
            continue
        }
        
        answer += d % coverage != 0 ? (d / coverage)+1 : d / coverage  
    }

    return answer
}