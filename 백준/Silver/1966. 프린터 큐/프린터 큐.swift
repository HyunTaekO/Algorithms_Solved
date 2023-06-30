import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let NM = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let M = NM[1]
    var queue = readLine()!.components(separatedBy: " ").enumerated().map{ [$0.offset, Int($0.element)!] }
    var sequence: [Int] = []
    while !queue.isEmpty {
        let r = queue.removeFirst()
        let first = r[1]
        let index = r[0]
        if queue.filter({ $0[1] > first }).count > 0 {
            queue.append(r)
        }else {
            sequence.append(index)
        }
    }
    print(sequence.lastIndex(of: M)!+1)
}