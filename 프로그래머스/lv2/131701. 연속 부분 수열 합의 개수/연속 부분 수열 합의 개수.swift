import Foundation

func solution(_ elements:[Int]) -> Int {
    let nums = elements + elements
    var sumList: Set<Int> = []
    for l in 0..<elements.count {
        var num = 0
        for start in 0..<elements.count {
            num += nums[start + l]
            sumList.insert(num)
        }
    }
        
    return sumList.count
}