import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    if cacheSize == 0 {
        return 5 * cities.count
    }
    
    var cities = cities.map{$0.lowercased()}
    
    var cache: [String] = []
    
    var time: Int = 0
    
    for city in cities {
        
        if let index = cache.firstIndex(of:city) { // 캐쉬에 있음
            time += 1 // cache hit
            
            if index != cache.count-1  { // 만약 가장 최근 값이 아니면
                cache.remove(at:index) // 해당 위치 지우고
                cache.append(city) // 가장 최근으로 넣어 줌 
            }
            
        } else { // 캐쉬 미스
            time += 5 
            
            if cache.count == cacheSize { // 꽉차있으면 , 가장 앞에꺼 제거 
                cache.removeFirst()
            }
            cache.append(city)
        }
        
    }
    
    
    return time
}