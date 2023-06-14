import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var dic: [String: [String]] = [:] // 신고당한사람 : 신고한사람[]
    var result: [String: Int] = [:]
    var answer: [Int] = []
    for r in report {
        let sp = r.split(separator: " ").map{String($0)}
        let id = sp[0]
        let reportId = sp[1]
        
        if let d = dic[reportId] {
            if d.contains(id) {
                continue
            }else {
                dic[reportId] = d + [id]
            }
        }else {
            dic[reportId] = [id]
        }
    }
    
    for i in dic.values {
        if i.count < k {
            for r in i {
                if let res = result[r] {
                    continue
                }else {
                    result[r] = 0
                }
            }
            continue
        }else {
            for r in i {
                if let res = result[r] {
                    result[r] = res + 1
                }else {
                    result[r] = 1
                }
            }
            
        }
    }
    for i in id_list {
        answer.append(result[i] ?? 0)
    }
    return answer
}