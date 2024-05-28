import Foundation

extension String {
    
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    public subscript(_ range: Range<Int>) -> String {
        
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        
        
        return String(self[startIndex..<endIndex])
    }
}


func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

var shortCut: Set<String> = Set<String>()


var result: [String] = []

let a = "ABC"


let n = Int(readLine()!)!

for _ in 0..<n {
    
    var words = readLine()!.split{$0 == " "}.map{String($0)}
    
    var succ: Bool = false
    
    for (i,firstAlpha) in words.compactMap{$0.first}.enumerated() {
        
        let command = firstAlpha.lowercased()
        
        if !succ && !shortCut.contains(command) {
            shortCut.insert(command)
            succ = true
            
            words[i] = "[\(firstAlpha)]\(words[i].count > 1 ? words[i][1..<words[i].count] : "")"
            result.append(words.joined(separator: " "))
            break
        }
        
    }
    
    if succ {
        continue
    }
    
    for (i,word) in words.enumerated() {
        
        for j in 0..<word.count {
            
            let command = word[j]
            
            if !succ && !shortCut.contains(command.lowercased()) {
                shortCut.insert(command.lowercased())
                words[i] = "\(word[0..<j])[\(command)]\(word[j+1..<word.count])"
                succ = true
                break
            }
        }
        
        if succ {
            break
        }
            
    }
        

    
    if succ {
        result.append(words.joined(separator: " "))
    } else {
        result.append(words.joined(separator: " "))
    }
    

}

print(result.joined(separator: "\n"))
