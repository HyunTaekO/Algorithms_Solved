import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var result = 0
    let queues = queue1 + queue2
    var sum = queue1.reduce(0, +)
    let targetSum = (sum + queue2.reduce(0, +)) / 2
    guard sum != targetSum else { return 0 }
    var left = 0
    var right = queue1.count - 1
    while left < right {
        result += 1
        
        if sum < targetSum {
            right += 1
            if right == queues.count { break }
            sum += queues[right]
        }else if sum > targetSum {
            sum -= queues[left]
            left += 1
        }
        
        if sum == targetSum { return result }
        
    }
    return -1
}