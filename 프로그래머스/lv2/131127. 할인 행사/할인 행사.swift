import Foundation
func contain(_ queue: [String],_ want:[String],_ dic: [String: Int]) -> Bool {

    for i in want {
        
        if queue.filter{$0 == i}.count == dic[i]! {
            continue
        }else {
            return false
        }
    }
    return true
}
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var queue: [String] = []
    var dic: [String: Int] = [:]
    var result = 0
    for i in want.indices {
        dic[want[i]] = number[i]
    }
    for i in 0..<discount.count {
        
        queue.append(discount[i])
        if queue.count == 10 {
            if contain(queue, want, dic) {
                result += 1
                queue.removeFirst()
                continue
            }else {
                queue.removeFirst()
            }
        }
    }
    return result
}