
func convert(_ str:String) -> Int {
    
    let split = str.split{$0 == ":"}
    
    
    return Int(split[0])!*60 + Int(split[1])!
}


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
    
    var m = m
    
    m = m.replacingOccurrences(of:"C#",with:"H")
        .replacingOccurrences(of:"D#",with:"I")
        .replacingOccurrences(of:"G#",with:"J")
        .replacingOccurrences(of:"A#",with:"K")
        .replacingOccurrences(of:"F#",with:"L")
    
    
    
    let none: String = "(None)"
    
    var musicinfos = musicinfos.map({
    
        $0.replacingOccurrences(of:"C#",with:"H")
        .replacingOccurrences(of:"D#",with:"I")
        .replacingOccurrences(of:"G#",with:"J")
        .replacingOccurrences(of:"A#",with:"K")
        .replacingOccurrences(of:"F#",with:"L")

    })
    
    // # 붙은거를 다른 문자로 교체
    
    var ans: String = none
    
    var time: Int = 0
    
    for music in musicinfos {
        
        let music = music.split{$0 == ","}.map{String($0)}
        
        let melody = music[3]
        
        let playTime = convert(music[1]) - convert(music[0]) // 플레이 시간(분)
        
        var play = ""
        
        for i in 0..<playTime {
            let index = i % melody.count
            play += melody[index]
        }
        
        if play.contains(m) && time < playTime  { // 재생된 결과에 해당 멜로디가 있으면
            time = playTime
            ans = music[2]
        }
    }
    
    return ans
}