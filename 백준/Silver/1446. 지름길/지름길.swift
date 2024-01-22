let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,d) = (input[0],input[1])

var graph: [[(Int,Int)]] =  [[(Int,Int)]](repeating: [], count: 10001)
var dist: [Int] = [Int](repeating: 10000, count: 10001)


for _ in 0..<n {
    
    let input2 = readLine()!.split{$0 == " "}.map{Int($0)!}

    let (depart,arrive,dist) = (input2[0],input2[1],input2[2])
    
    if arrive > d || depart > d || arrive - depart < dist { // 도착지 벗어나거나  , 고속도로 그냥달리는 것보다  dist가 더 크면 , 지름길 아님
        continue
    }
    
    graph[depart].append((arrive, dist))

}



var prev: Int = -1

for i in 0...d {
    
    if i == 0 {
        prev = -1
    } else {
        prev = dist[i-1]
    }
    
    dist[i] = min(dist[i],prev+1) // dist[i] = (현재 최단거리, 고속도로 i-1에서 +1)
    
    
    
    for edge in graph[i] {
        
        let end = edge.0
        let dd  = edge.1
        
        dist[end] = min(dist[end],dist[i]+dd) // 현재와 , i에서 지름길 탔을 때
        
    }
    
}

print(dist[d])


