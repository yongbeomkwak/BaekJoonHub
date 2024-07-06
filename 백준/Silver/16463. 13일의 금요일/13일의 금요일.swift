import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

func isLeapYear(_ year: Int) -> Bool {
    
    return ((year % 400) == 0) || ((year%4) == 0 && (year%100 != 0))
    
}

let endYear = Int(readLine()!)!

let days: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

var day = 4

var ans: Int = 0

for year in 2019...endYear {
    
    for i in 0..<12 {
        var div = days[i]
        if isLeapYear(year) && i == 1 {
            div = 29
        }
        
        while day < div {
            
            if day == 13 {
                ans += 1
            }
            
            day += 7
        }
        
        day %= div
        
    }
}

print(ans)

