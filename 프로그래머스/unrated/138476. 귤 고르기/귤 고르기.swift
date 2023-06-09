import Foundation


func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var result = 0
    var dic: [Int: Int] = [:]
    var cnt = 0
    for i in tangerine {
        if let d = dic[i] {
            dic[i] = d + 1
        }else {
            dic[i] = 1
        }
    }
    
    for i in dic.sorted{ $0.1 > $1.1 }{
        if cnt < k {
            cnt += i.value
            result += 1
        }else {
            break
        }
    }
    return result
}
