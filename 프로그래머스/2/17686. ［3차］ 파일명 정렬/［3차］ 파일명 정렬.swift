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

func solution(_ files:[String]) -> [String] {
    

    var splitedFiles:[[String]] = []
    

    
    
    for file in files {
        var state = 0
        var head = ""
        var number = ""
        var tail = ""
        
        file.forEach{ c in
            
            if c.isNumber && state == 0{
                state = 1
            }
            
            if !c.isNumber && state == 1{
                state = 3 
            }
            
            if state == 0 {
                head += String(c)
            } else if state == 1 {
                number += String(c)
            } else {
                tail += String(c)
            }
        }
        
        splitedFiles.append([head,number,tail])
    }
    
    
    return splitedFiles.enumerated().sorted(by:{ 
        
        let head1 = $0.element[0].lowercased()
        let head2 = $1.element[0].lowercased()
        let number1 = Int($0.element[1])!
        let number2 = Int($1.element[1])!
        
        if head1 != head2 { return head1 < head2} // 
        if number1 != number2 {return number1 < number2}  
        
        
        // 모두 같으면 , stable sort
        return $0.offset < $1.offset
    }).map{$0.element}.map{$0.joined()}
    


}