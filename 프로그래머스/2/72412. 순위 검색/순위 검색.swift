import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
 var db: [String : [Int]] = [ : ] // key: [점수]
    var result: [Int] = []

    // db 생성
    for i in info {
        let arr = i.components(separatedBy: " ")
        let languages = [arr[0], "-"]
        let jobs = [arr[1], "-"]
        let careers = [arr[2], "-"]
        let soulFoods = [arr[3], "-"]
        let score = Int(arr[4])!

        for language in languages{
            for job in jobs{
                for career in careers {
                    for soulFood in soulFoods {
                        let key = "\(language)\(job)\(career)\(soulFood)"
                        if db[key] == nil {
                            db[key] = [score]
                        } else {
                            db[key]?.append(score)
                        }
                    }
                }
            }
        }
    }
    
    for key in db.keys {
        db[key] = db[key]!.sorted() // 이진 탐색을 위해 오름차순 정렬
    }
    
    var ans:[Int] = []
    
    for q in query {
        let arr = q.components(separatedBy: " ")
        let key = "\(arr[0])\(arr[2])\(arr[4])\(arr[6])"
        let score = Int(arr[7])!
        
        
        var left = 0
        
        if db[key] == nil {
            ans.append(0)
            continue
        } else {
            
            var left = 0
            let cnt = db[key]!.count
            var right = cnt-1
            let arr = db[key]!
    
            
            while left <= right {
                let mid = (left+right)/2
                
                if score > arr[mid] {
                    
                    left = mid+1
                    
                } else {
                    
                    right = mid-1 
                }
                
            }
            
            ans.append(cnt-left)
        }
    }
    
    return ans
}