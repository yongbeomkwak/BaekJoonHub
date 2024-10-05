import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    let col = col-1
    let row_begin = row_begin-1
    let row_end = row_end
    
    var data = data.sorted(by: { $0[col] == $1[col] ? $0[0] > $1[0] : $0[col] < $1[col] })
    
    var arr: [Int] = []
    
    for row in row_begin..<row_end {
        let i = row + 1 
        let sum = data[row].map{ $0 % i }.reduce(0, +)
        arr.append(sum)
    }
    
    var now = 0
    
    for i in 0..<arr.count {
        now = now ^ arr[i]
    }
    
    return now
}