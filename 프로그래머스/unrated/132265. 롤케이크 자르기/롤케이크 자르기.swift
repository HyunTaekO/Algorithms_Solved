import Foundation

func solution(_ topping:[Int]) -> Int {
    var result = 0
    var dic: [Int: Int] = [:]
    var set: Set<Int> = []
    for i in 0..<topping.count {
        if let d = dic[topping[i]] {
            dic[topping[i]] = d + 1
        }else {
            dic[topping[i]] = 1
        }
    }
    for i in 0..<topping.count {
        set.insert(topping[i])
        dic[topping[i]]! -= 1
        if dic[topping[i]] == 0 {
            dic[topping[i]] = nil
        }
        if set.count == dic.count {
            result += 1
        }
    }
    return result
}