import Foundation

extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}


func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var score:[String:Int] = [String:Int]()
    
    var result:String = ""
    
    for i in 0..<choices.count {
        let fir = survey[i][0]
        let scd = survey[i][1]
        
        let cho:Int = choices[i]
        if cho < 4 {
            score[fir] = (score[fir] ?? 0) + (4 - cho)
            
        } else if cho ==  4 {
           continue
        }
        else {
             score[scd] = (score[scd] ?? 0) + (cho - 4)
        }
        

    }
    
    let order:[String] = ["RT","CF","JM","AN"]
    
    for ord in order {
        let fir = ord[0]
        let scd = ord[1]
        
        let sc1 = score[fir] ?? 0
        let sc2 = score[scd] ?? 0
        
      
        if sc1 >= sc2{
            result  += fir
        }
        else {
            result += scd
        }
    
       
        
    }
    
    
    return result
}
