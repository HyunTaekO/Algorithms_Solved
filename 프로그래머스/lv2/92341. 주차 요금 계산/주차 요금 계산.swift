import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var dic: [String: Int] = [:]
    var timeDic: [String: String] = [:]
    var check: [String: Bool] = [:]
    var result: [Int] = []
    for record in records {
        let split = record.split(separator: " ").map{ String($0) }
        let carNum = split[1]
        let state = split[2]
        if state == "IN" {
            timeDic[carNum] = split[0]
            check[carNum] = false
            continue
        }else {
            let outTime = (Int(split[0].prefix(2))! * 60) + Int(split[0].suffix(2))!
            let inTime = (Int(timeDic[carNum]!.prefix(2))! * 60) + Int(timeDic[carNum]!.suffix(2))!
            if let t = dic[carNum] {
                dic[carNum] = t + (outTime - inTime)
            }else {
                dic[carNum] = outTime - inTime
            }
            check[carNum] = true
        }
        
    }
    let lastTime = (23 * 60) + 59
    for key in check.filter({ $0.value == false }).keys {
        let inTime = (Int(timeDic[key]!.prefix(2))! * 60) + Int(timeDic[key]!.suffix(2))!
        if let t = dic[key] {
            dic[key] = t + (lastTime - inTime)
        }else {
            dic[key] = lastTime - inTime
        }
    }
    
    let cars = dic.keys.sorted(by: { Int($0)! < Int($1)! })
    for car in cars {
        let p = pay(dic[car]!, fees)
        result.append(p)
    }
    return result
}

func pay(_ time: Int,_ fees: [Int]) -> Int {
    var cash = 0
    if time <= fees[0] { return fees[1] }
    cash = fees[1]
    let overT = ceil(Double(time - fees[0]) / Double(fees[2]))
    cash += Int(overT) * fees[3]
    return cash
}