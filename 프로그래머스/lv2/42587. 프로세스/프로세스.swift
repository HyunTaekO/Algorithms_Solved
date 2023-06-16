import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities
    var loc = location
    var cnt = 0
    while !queue.isEmpty {
        let p = queue.removeFirst()
        loc -= 1
        if p < queue.max() ?? 0 {
            queue.append(p)
            if loc < 0 {
                loc = queue.count-1
            }
        }else {
            cnt += 1
            if loc < 0 {
                return cnt
            }
        }
       
    }
    return cnt
}