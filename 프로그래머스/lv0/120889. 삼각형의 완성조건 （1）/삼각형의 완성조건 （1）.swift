import Foundation

func solution(_ sides:[Int]) -> Int {
     let  sides  = sides.sorted()
    return sides[2] < sides[0] + sides[1] ? 1 : 2
}