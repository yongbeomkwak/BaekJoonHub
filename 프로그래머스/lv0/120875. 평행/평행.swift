func isParallel(_ a1: [Int], _ a2: [Int], _ b1: [Int], _ b2:[Int]) -> Bool { 
    return abs(Double(a2[1] - a1[1]) / Double(a2[0] - a1[0])) == abs(Double(b2[1] - b1[1]) / Double(b2[0] - b1[0]))
}

func solution(_ dots:[[Int]]) -> Int {
    let points = dots.sorted { $0[1] < $1[1] }

    return isParallel(points[0], points[1], points[2], points[3]) || isParallel(points[0], points[2], points[1], points[3]) || isParallel(points[0], points[3], points[1], points[2]) ? 1 : 0
}