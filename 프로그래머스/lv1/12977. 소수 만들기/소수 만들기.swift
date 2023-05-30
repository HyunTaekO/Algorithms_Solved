import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    var q = 0
    for i in 0..<nums.count {
        for i1 in i+1..<nums.count {
            for i2 in i1+1..<nums.count {
                let sum = nums[i] + nums[i1] + nums[i2]
                if sum == 1 {
                    answer += 1
                    continue
                }
                for s in 2...sum where sum % s == 0 {
                    q += 1
                    if q > 1 {
                        q = 0
                        break
                    }
                }
                if q == 1 {
                    q = 0
                    answer += 1
                }
               
            }
        }
    }

    return answer
}