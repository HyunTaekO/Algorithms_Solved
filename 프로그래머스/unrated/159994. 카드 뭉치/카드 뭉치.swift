import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var check1 = 0
    var check2 = 0
    
    for i in 0..<goal.count {
        
        if goal[i] == cards1[check1] {
            if check1 < cards1.count - 1 {
                check1 += 1
            }
            continue
        }else if goal[i] == cards2[check2] {
            if check2 < cards2.count - 1 {
                check2 += 1
            }
            continue
        }else {
            return "No"
        }
    }
    return "Yes"
}