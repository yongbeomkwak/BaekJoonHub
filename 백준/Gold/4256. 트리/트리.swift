import Foundation

let tc = Int(readLine()!)!

for _ in 0..<tc {
    
    let n = Int(readLine()!)!
    
    var preOrder = readLine()!.split{ $0 == " " }.compactMap{ Int(String($0))! }
    let inOrder = readLine()!.split{ $0 == " " }.compactMap{ Int(String($0))! }
    var result:[String] = []
    postOrder(preOrder: &preOrder, inOrder: inOrder)
    
    print(result.joined(separator: " "))
    
    func postOrder(preOrder: inout [Int], inOrder:[Int]){
        
        if inOrder.isEmpty || preOrder.isEmpty {
            return
        }

        let root = preOrder.first ?? 0
        preOrder.remove(at: 0)
       
        let index = inOrder.firstIndex(of: root) ?? 0
        postOrder(preOrder: &preOrder, inOrder: Array(inOrder[0..<index]))
        postOrder(preOrder: &preOrder, inOrder: Array(inOrder[index+1..<inOrder.count]))
        result += [String(root)]
    }
}






