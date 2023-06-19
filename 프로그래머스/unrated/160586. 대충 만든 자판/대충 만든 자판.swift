import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var arr: [[String]] = []
    var dic: [String: Int] = [:]
    var result: [Int] = []
    for key in keymap {
        arr.append(key.map{String($0)})
    }
    for i in arr {
        for j in 0..<i.count {
            if let d = dic[i[j]] {
                if j+1 < d {
                    dic[i[j]] = j + 1
                }
            }else {
                dic[i[j]] = j + 1
            }
        }
    }
    var check = false
    for t in targets {
        var cnt = 0
        for i in t {
            if let tar = dic[String(i)] {
                check = false
                cnt += tar
            }else {
                result.append(-1)
                check = true
                break
            }
        }
        if check {
            continue
        }else {
            result.append(cnt)
        }
    }
    return result
}