import Foundation

func solution(_ common:[Int]) -> Int {
    var check = false
    var equal = 0
    let last = common.count-1 
    if common[last] - common[last-1] == common[last-1] - common[last-2] {
        check = true
        equal = common[last] - common[last-1]
    }else {
        equal = common[last] / common[last-1]
    }
    
    
    
    return check ? common[common.count-1] + equal : common[common.count-1] * equal
}