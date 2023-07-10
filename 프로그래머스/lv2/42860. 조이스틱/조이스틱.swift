import Foundation

func solution(_ name:String) -> Int {
    let name = Array(name)
    let aValue = Int(Character("A").asciiValue!)
    let zValue = Int(Character("Z").asciiValue!)

    // 1
    var updown = 0    
    var leftright = name.count-1  

    for startIdx in 0..<name.count {
        // 2
        updown += min(Int(name[startIdx].asciiValue!) - aValue, zValue - Int(name[startIdx].asciiValue!) + 1)

        // 3
        var endIdx = startIdx + 1
        while endIdx < name.count && name[endIdx] == "A" {
            endIdx += 1
        }

        // 4
        let moveFront = startIdx * 2 + (name.count - endIdx)
        let moveBack = (name.count - endIdx) * 2 + startIdx

        // 5
        leftright = min(leftright, moveFront)
        leftright = min(leftright, moveBack)
    }

    // 6
    return updown + leftright
}