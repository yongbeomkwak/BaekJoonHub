import Foundation

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let kl = input()

let (k,l) = (kl[0],kl[1])

var dict: [String:Int] = [:]

for i in 0..<l {
    let key = readLine()!
    dict[key] = i
}

let sorted_list = dict.sorted{$0.value < $1.value}.map{$0.key}

var result: [String] = []

for i in 0..<k {
    
    if sorted_list.count <= i {
        break
    }
    
    result.append(sorted_list[i])
}

print(result.joined(separator: "\n"))
