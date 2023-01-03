import Foundation


func sum(_ arr:[Int]) -> Int
{
    return arr.reduce(0,+)
}

func solution(_ num:Int, _ total:Int) -> [Int] {
    
    var ans:[Int] = []
    let nSum:Int = num * (1 + num) / 2;
    let start = (total - nSum) / num;

     for i in 1...num {
            ans.append(i + start)
    }
  
    
   
    return ans
   
}