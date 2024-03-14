let n = Int(readLine()!)!

var arr = Array(readLine()!)

var prev : Character = "X"

var count: Int = 0

for i in 0..<n {
    
    if prev == "E" && arr[i] == "W" {
        count += 1
    }
    
    prev = arr[i]
    
}

print(count)
