import Foundation 

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    if cacheSize == 0 {
        return 5 * cities.count
    }
    var time:Int = 0
    
    var cache = Array<String>()
    
    var cities = cities.map{$0.uppercased()}
    
    for citi in cities {
        
        if let index = cache.firstIndex(of:citi) {
            time += 1 
            
            cache.remove(at:index)
            
            cache.append(citi)
            continue
        }
        
        time += 5
        if  cache.count == cacheSize {
            cache.remove(at:0)
        }
        cache.append(citi)
 
    }
    
    

    
    
    
    
    
    return time 
}