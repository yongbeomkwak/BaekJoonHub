

let HIT: Int = 1
let MISS: Int = 5




func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    func getNewCahce(_ oldCache:[String], _ city:String) -> [String] {
        
        var newCache = oldCache
        
        if let index = newCache.firstIndex(of: city) { // 존재하면 해당 인덱스 삭제
              newCache.remove(at: index)
        }
        
        if newCache.count == cacheSize { // 없으면
            newCache.removeLast()
        }
        
        newCache.insert(city,at:0)
        
        
        return  newCache
    }
    
    var cache: [String] = []
    var count:Int = 0
    
    if cacheSize == 0 { return 5*cities.count }
    else{
      for city in cities{
        let lowedCity = city.lowercased()
        if cache.contains(lowedCity){ count += 1 }
        else{ count += 5 }
        cache = getNewCahce(cache,lowedCity)
      }
    }
    
    
    return count
}