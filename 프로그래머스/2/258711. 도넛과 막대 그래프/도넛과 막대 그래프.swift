import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    // 중앙 정점이 가르키는 각 그래프 정점 특징
    // n 도넛 = 규칙이 크게 없음, 그냥  막대와 8자를 구하고 나머지를 도넛
    // n 막대 = 나가는 정점 없음 
    // 8자 막대 = 나가는 정점 들어오는 정점 2개 이상
    // 입력 = [[출발 정점, 도착정점]]
    // 결과 = [정점, 도넛, 막대, 8자]
    // 정점은 나가는 정점이 가장 많은게 될 듯
    var answer: [Int] = [0, 0, 0, 0]
    var graph: [Int: [Int]] = [:]
    var inDegrees: [Int: Int] = [:]
    var outDegrees: [Int : Int] = [:]
    
    var maxVertex: Int = -1
    
    for edge in edges {
        let departureVertex = edge[0]
        let destinationVertex = edge[1]
        
        maxVertex = max(departureVertex, maxVertex)
        maxVertex = max(destinationVertex, maxVertex)
        
        
        outDegrees[departureVertex, default: 0] += 1
        inDegrees[destinationVertex, default: 0] += 1
        graph[departureVertex, default: []].append(destinationVertex)
        
        
    }

    for v in 1...maxVertex {
    
        let inCount = inDegrees[v, default: 0]
        let outCount = outDegrees[v, default: 0]
        
        // 존재하지 않는 정점
        if inCount == 0 && outCount == 0 { continue }
        
        if inCount == 0 && outCount >= 2 { // 들어가는 간선이 없고 나가는 간선이 2이상이면 중앙 점점
            // 나가는 간선이 2 이상인 이유는 , 그래프 수의 합이 2 이상이기때뮨에
            answer[0] = v 
        } else if inCount >= 2 && outCount >= 2 { // 8자
            // inCount: (정점에서 가르키는 간선 + 8자 가운데 간선)
            // outCount: 8자 가운데에서 나가는 간선
            answer[3] += 1 
        } else if inCount <= 2 && outCount == 0 { // 막대 
            // inCount: (정점에서 가르키는 간선 + 막대 그래프 내에서 가르키는 간선)
            // outCount: 나가는 간선이 없음
            answer[2] += 1 
        }
        
    }
    
    // 도넛그래프 수 = 전체그래프 수 - (막대 + 8자)
    answer[1] = graph[answer[0]]!.count - (answer[2] + answer[3])  

    return answer
}