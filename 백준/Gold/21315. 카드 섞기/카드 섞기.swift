import Foundation

let n = Int(readLine()!)!

let target = readLine()!.split{$0 == " "}.map{Int($0)!}

let card = target.sorted()

let coverag =  Int(log2(Float(n)))

var find: Bool = false
var result: [Int] = []

for k1 in 1...coverag {
    var tmp = card
    
    let firstReuslt = shuffle(1,k1,tmp)
    for k2 in 1...coverag {
        let secondResult = shuffle(1,k2,firstReuslt)
        
        if target == secondResult {
            find = true 
            result.append(k1)
            result.append(k2)
            break
        }
        
        
    }
    
    if find == true {
        break
    }
    
}

func shuffle(_ steps: Int ,_ k:Int,_ cards:[Int]) -> [Int] {
    
    
    if steps == 1 {
    
        let line = cards.count -  1 << k
        
        let top = Array(cards[0..<line])
        
        let bottom = Array(cards[line..<cards.count])
        

        return shuffle(steps+1, k, bottom) + top
        
    }
    
    if steps == k+2 {
        return cards
    }
    
    let line = 1 << (k-steps+1)
    
    let top = Array(cards[0..<line])
    let bottom = Array(cards[line..<cards.count])
    
    return  shuffle(steps+1, k, bottom) + top
    
}


print("\(result[0]) \(result[1])")
    







