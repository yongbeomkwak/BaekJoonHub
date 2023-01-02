import Foundation

func solution(_ common:[Int]) -> Int {
    let len = common.count
    let last = common[len-1]
    if( len == 2)
    {
        return last + (common[1] - common[0]) 
    }
    else
    {
        
        if(common[2] - common[1]  == common[1] - common[0])
        {
            let d = common[1] - common[0]
            return last + d
        }
        else
        {
            let d = common[1] / common[0]
            return last * d
        }
    }
    
    
    
    
    
    
    return 0
}