import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result = ""
    var dic = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    for i in 0..<survey.count {
        let choice = choices[i]
        if choice < 4 { // 비동의
            dic[String(survey[i].first!)]! += abs(choice - 4)
        }else if choice == 4 { // 모르겠음 
            continue
        }else { // 동의
            dic[String(survey[i].last!)]! += (choice - 4)
        }
    }
    if dic["R"]! >= dic["T"]! { result = "R" }
    else { result = "T" }
    if dic["C"]! >= dic["F"]! { result += "C" }
    else { result += "F" }
    if dic["J"]! >= dic["M"]! { result += "J" }
    else { result += "M" }
    if dic["A"]! >= dic["N"]! { result += "A" }
    else { result += "N" }
    
    return result
}