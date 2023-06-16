import Foundation

func solution(_ s1:[String], _ s2:[String]) -> Int {
    var cnt = 0
    if s1.count >= s2.count {
        for i in s2 {
            if s1.contains(i) {
                cnt += 1
            }
        }
    }else if s1.count < s2.count {
        for i in s1 {
            if s2.contains(i) {
                cnt += 1
            }
        }
    }
    return cnt
}