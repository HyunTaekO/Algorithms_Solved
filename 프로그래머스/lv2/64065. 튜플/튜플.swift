import Foundation

func solution(_ s:String) -> [Int] {
    var str = s
    var result: [Int] = []
    str.removeFirst()
    str.removeLast()
    let numSet = str.components(separatedBy: ["{", "}"]).filter{ $0 != "" && $0 != "," }.map{ $0.split(separator: ",").map{ Int(String($0))!}}
    
    var temp: Set<Int> = []
    for i in numSet.sorted(by: { $0.count < $1.count }) {
        let num = Set(i).subtracting(temp).first!
        result.append(Int(exactly: num)!)
        temp = Set(i)
    }

    return result
}