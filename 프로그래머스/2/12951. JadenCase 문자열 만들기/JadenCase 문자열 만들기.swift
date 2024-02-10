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

func solution(_ s:String) -> String {
    
    var jaden: (String) -> String  = { (str:String) -> String in
        
        if str.isEmpty {
            return ""
        }
                                      
        if str.count == 1 {
            return str.uppercased()
        }
                              
                                      
         return String(str.prefix(1).uppercased()) + str[1..<str.count].lowercased()           
    }
    
    var arr = s.components(separatedBy: " ").map{String($0)}.map{jaden($0)}
    
    
    return arr.joined(separator:" ")
}