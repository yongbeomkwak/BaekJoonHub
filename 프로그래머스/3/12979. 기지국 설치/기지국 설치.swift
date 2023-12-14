import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var ans = 0
    
    
    var start = 1 
    let range = (2*w+1) // 기지국 전파 범위
    
    for station in stations {

        let end = station - w < 0 ? 1 : station - w  // 현재 기지국 왼쪽 편
        
        let next = station+w > n ? n : station+w // 현재 기지국 오른쪽 편
            
        let need_station = Int(ceil(Double(end-start)/Double(range))) 
        
        //현재 left ~ right 까지 범위에 추가 설치할 기지국 개수는, 해당범위를 전파 범위로 나눈 것의 올림만큼 필요
        
        ans += need_station
        
        start = next+1 // 다음 범위는 현재 기지국 오른쪽편의 다음부터 시작
        
    }
     let end = n // 마지막 오른쪽 편은 가장 끝 아파트
    
    
     let need_station = Int(ceil(Double(end-start+1)/Double(range))) // 마지막 n 아파트를 포함하니깐 +1
     ans += need_station
     
    
   
    
    
    

    return ans
}