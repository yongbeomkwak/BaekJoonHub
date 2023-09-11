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



func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var m =  m.replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map{String($0)}
            .joined()
    
    func playMusic(_ start:String,_ end:String,_ song:String) -> (Int,Bool){
        
        let startTime:[Int] = start.split{$0 == ":"}.map{Int($0)!}
        let endTime:[Int] = end.split{$0 == ":"}.map{Int($0)!}
        let startMin = 60 * startTime[0] + startTime[1]
        let endMin =  60 * endTime[0] + endTime[1]

        let playTime = endMin - startMin

        var entireSong:String = ""


        for i in 0..<playTime{
            let index = i % song.count
            entireSong += song[index]
        }   
        

        
        
        return (playTime,entireSong.contains(m))
    
    }
    
    var answer:(String,Int) = ("(None)",0)
    
    for musicinfo in musicinfos {
        
        let musicinfo = musicinfo.split{$0 == ","}.map{String($0)}
        let start = musicinfo[0]
        let end = musicinfo[1]
        let name = musicinfo[2]
        let song = musicinfo[3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map{String($0)}
            .joined()
        
        let (playTime,isMatch) : (Int,Bool) = playMusic(start,end,song)
        
        if isMatch {
             answer = answer.1 < playTime ? (name,playTime) : answer
        }
        
    }
    
    
    return answer.0
}