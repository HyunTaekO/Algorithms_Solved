import Foundation
// 18:21 ~ 
// today: 오늘 날짜 / terms: 약관 유효기간 배열 / privacies: 수집된 개인정보 배열 => 파기해야 할 개인정보 번호 리턴

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termDict: [String: Int] = [:] // 약관 : 기간
    var result: [Int] = []
    for term in terms {
        let split = term.split{ $0 == " " }.map{String($0)}
        let (type, month) = (split[0], Int(split[1])! * 28) // 1달 => 28 매핑
        termDict[type] = month 
    }
    let today = trans(today)
    
    for i in 0..<privacies.count {
        let split = privacies[i].split{$0 == " "}.map{ String($0) }
        let (date, type) = (trans(split[0]), split[1])
        if today >= date + termDict[type]! {
            result.append(i+1)
        }
    }
    return result
}

func trans(_ date: String) -> Int {
    let split = date.split{$0 == "."}.map{ Int(String($0))! }
    let (year, month, day) = (split[0], split[1], split[2])
    return (year * 12 * 28) + (month * 28) + day
}