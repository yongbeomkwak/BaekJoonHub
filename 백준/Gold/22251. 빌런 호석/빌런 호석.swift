import Foundation

let nkpx = readLine()!.split{$0 == " "}.map{Int($0)!}

var (n,k,p,x) = (nkpx[0],nkpx[1],nkpx[2],nkpx[3])

var cx: [Int] = []

if String(x).count < k {
    
    cx = [Int](repeating: 0, count: k-String(x).count)
    
    for xx in Array(String(x)) {
        cx.append(Int(String(xx))!)
    }
} else {
    cx = Array(String(x)).map{Int(String($0))!}
}

var num :[[Int]] = [[1,1,1,1,1,1,0],[0,1,1,0,0,0,0], [1,1,0,1,1,0,1], [1,1,1,1,0,0,1], [0,1,1,0,0,1,1], [1,0,1,1,0,1,1],[1,0,1,1,1,1,1],[1,1,1,0,0,0,0], [1,1,1,1,1,1,1], [1,1,1,1,0,1,1]]

var arr : [[Int]] = [] // 각 숫자별 차이

for i in 0...9 {
    arr.append([])
    
    for j in 0...9 {
        
        if i == j { // 같으면 0
            arr[i].append(0)
        }
        
        else { // 다르면 led 차이 개수 저장
            var diff : Int = 0
            
            for h in 0..<7 {
                if num[i][h] != num[j][h] {
                    diff += 1
                }
            }
            
            arr[i].append(diff)
        }
    }
}



func dfs(_ depth: Int, _ cnt: Int, _ cx: [Int]) -> Int { // (깊이, 남은 반전 횟수, 현재 문자열)
    
    if depth >= cx.count {
        
        var base = Int(pow(10,Float(cx.count-1)))
        var result = cx.reduce(0) { prev, n in
            
            var result = prev + n * base
            base /= 10
            
            return result
        } // cx 배열을 실제 숫자로
        
        if result == x { // 처음 주어진 층은 안됨
            return 0
        } else if 1...n ~= result {
            return 1
        } else {
            return 0
        }
        
    }
    
    var (result,cur) = (0,cx[depth]) // 결과 , 현재 바꿔줄 숫자
    
    for i in 0...9 {
        
        if cur != i && arr[cur][i] <= cnt { // 0~9부터 같은 숫자가 아니고 curr와 i의 차이가 남은 반전 횟수보다 적으면
            
            var tmp = cx
            tmp[depth] = i  // 현재 배꿔줄 숫자를 i로 바꿈
            
            result += dfs(depth+1, cnt-arr[cur][i], tmp) // 뎁스 증가, 남은횟수 차감 , 바꾼걸로 결과
        }
        
        else if cur == i { // 같으면 뎁스만 증가
            
            result += dfs(depth+1,cnt,cx)
        }
        
    }
    
    return result
}

print(dfs(0, p, cx))
