import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    let oArr = orders.map{ $0.map{ String($0) } }
    var dic: [String: Int] = [:]
    var comArr: [[String]] = Array(repeating: [], count: course.count)
    var result: [String] = []
    for i in 0..<orders.count {
        for j in 0..<course.count {
            if orders.count >= course[j] {
                let r = combi(orders[i].map{ String($0) }, course[j])
                guard r.count != 0 else{ continue }
                comArr[j] += r
            }
        }
    }
    
    for i in comArr {
        for j in i {
            if let d = dic[j] {
                dic[j] = d + 1
            }else {
                dic[j] = 1
            }
        }
    }
    
    var check = 2
    for i in course {
        check = 2
        for (k, v) in dic.filter{$0.0.count == i}.sorted(by: { $0.1 > $1.1 }) {
            if v >= check {
                check = v
                result.append(k)
            }
        }
    }
    result = result.sorted()
    return result
}
func combi(_ arr: [String],_ n: Int) -> [String] {
    var result: [String] = []
    func combination(index: Int, current: [String]) {
        if current.count == n {
            let c = current.sorted().joined()
            result.append(c)
            return
        }
        for i in index..<arr.count {
            combination(index: i + 1, current: current + [arr[i]])
        }
    }
    combination(index: 0, current: [])
    return result
}
