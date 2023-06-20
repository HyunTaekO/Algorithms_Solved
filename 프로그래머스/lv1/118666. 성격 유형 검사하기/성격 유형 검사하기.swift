import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dic: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var result = ""
    for i in 0..<survey.count {
        let first = String(survey[i].first!)
        let second = String(survey[i].last!)
        let c = choices[i] 
        if c == 1 {
            dic[first]! += 3
        }else if c == 2 {
            dic[first]! += 2
        }else if c == 3 {
            dic[first]! += 1
        }else if c == 4 {
            continue
        }else if c == 5 {
            dic[second]! += 1
        }else if c == 6 {
            dic[second]! += 2
        }else if c == 7 {
            dic[second]! += 3
        }
    }
    result += dic["R"]! >= dic["T"]! ? "R" : "T"
    result += dic["C"]! >= dic["F"]! ? "C" : "F"
    result += dic["J"]! >= dic["M"]! ? "J" : "M"
    result += dic["A"]! >= dic["N"]! ? "A" : "N"
    
    return result
}