import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    
    
    return numlist.sorted(by:{
        let lhs = abs($0 - n)
        let rhs = abs($1 - n)
        if( lhs == rhs )
        {
            return $0 > $1
        }
        else
        {
            return lhs < rhs 
        }
    })
    

}