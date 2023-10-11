import Foundation


func solution(_ storey:Int) -> Int {
    
    var storey: Int = storey 
    var result: Int = 0
    
    while storey != 0 {
        let suffix = storey % 10 
        let nextSuffix = (storey / 10 ) % 10
        
        if suffix > 5 || ( suffix == 5 && nextSuffix  >= 5) { 
            // 끝자리가 5보다 크거나
            // 끝자리가 5이고, 다음 끝자리가 5보다 같거나 크면 , 끝자리를 더하여 올림을 하는게 빠름 (다음 끝 자리까지 올려버리고 한번에 내리는게 이득 )
            // 555 -> 600 -> 500 -> 400 -> 300 ... 0 이 이득 
            
            result += 10 - (suffix)
            
            storey =  (storey / 10) + 1 //  뒷자리는 이제 해결했으니 버리고 올림 했으니 + 1
            
        } else {
            result += suffix // 뒷자리 그대로 내림처리
            
            storey = storey / 10 // 뒷자리 버리고 내림 처리 
            
        }
        
        
    }
    
    

    return result
}