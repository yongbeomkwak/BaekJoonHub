import Foundation

extension String {
    
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])  
    }
    
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}

func calcPlayTime(_ startTime: String, _ endTime: String) -> Int {

    let splitTime1 = startTime.components(separatedBy: ":") 
    let splitTime2 = endTime.components(separatedBy: ":") 

    let startMin = Int(splitTime1[0])!
    let startSec = Int(splitTime1[1])!
    let endMin = Int(splitTime2[0])!
    let endSec = Int(splitTime2[1])!

    return (endMin*60 + endSec ) - (startMin * 60 + startSec) 
} 

func makeEntireMelody(_ playSec: Int, _ melody: String) -> String {

    var result: [String] = []
    let count = melody.count

    for i in 0..<playSec {
        result.append(melody[i%count])
    }

    return result.joined()
}

func replaceSharpWithSymbol(_ code: String) -> String {
    // C#, D, D#, E, F, F#, G, G#, A, A#
    return code.replacingOccurrences(of: "C#", with: "H")
                .replacingOccurrences(of: "D#", with: "I")
                .replacingOccurrences(of: "F#", with: "J")
                .replacingOccurrences(of: "G#", with: "K")
                .replacingOccurrences(of: "A#", with: "L")
                .replacingOccurrences(of: "B#", with: "M")
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var m = replaceSharpWithSymbol(m)
    var longestPlayTime: Int = -1
    var title = "(None)"
    let count = m.count
    
    
    for musicinfo in musicinfos {
        let seperatedArr = musicinfo.components(separatedBy: ",")
        let startTime = seperatedArr[0]
        let endTime = seperatedArr[1]
        let musicTitle = seperatedArr[2]
        let melody = replaceSharpWithSymbol(seperatedArr[3])
   
        // [0] : 시작 시간
        // [1] : 끝난 시각
        // [2] : 음악 제목
        // [3] : 악보정보
        
        let playSec = calcPlayTime(startTime, endTime)
        let entireMelody = makeEntireMelody(playSec, melody)
        
        if entireMelody.contains(m) && longestPlayTime < playSec  {
            title = musicTitle
            longestPlayTime = playSec  
             continue   
        }
    }

    return title
}