import Foundation
func compare(_ sequence:[Int],_ sum: Int, _ k: Int,_ answer: [Int]) -> [Int] {
    var start = answer[0]
    var s = sum
    while true {
        guard s > k && answer[0] < answer[1] else{ return [start, s] }
        s -= sequence[start]
        start += 1
    }
    
    return [start, sum]
}
func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var answer: [Int] = [0, 0]
    var result: [Int] = []
    var sum = 0
    for i in 0..<sequence.count {
        sum += sequence[i]
        answer[1] = i
        
        if sum > k {
            let recom = compare(sequence, sum, k, answer)
            answer[0] = recom[0]
            sum = recom[1]
        }
        
        if sum == k {
            if result.isEmpty {
                result = answer
            }else {
                if result[1]-result[0] > answer[1]-answer[0] {
                    result = answer
                }
            }
            sum -= sequence[answer[0]]
            answer[0] += 1
        }
    }
    
    return result
}