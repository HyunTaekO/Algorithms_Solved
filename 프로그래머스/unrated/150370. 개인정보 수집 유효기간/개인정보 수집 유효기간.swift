import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result: [Int] = []
    var termDic: [String: Int] = [:]
    let todayS = today.split(separator: ".").map{Int(String($0))!}
    let today = (todayS[0] * 336) + (todayS[1] * 28) + todayS[2]
    
    for term in terms {
        let t = term.split(separator: " ").map{ String($0) }
        termDic[t[0]] = Int(t[1])! * 28
    }
    for i in 0..<privacies.count {
        let str = privacies[i].split(separator: " ").map{ String($0) }
        let dateS = str[0].split(separator: ".").map{ Int(String($0))! }
        let date = (dateS[0] * 336) + (dateS[1] * 28) + dateS[2]
        let type = str[1]
        let term = termDic[type]!
        if today >= date + term {
            result.append(i+1)
        }
    }

    return result
}