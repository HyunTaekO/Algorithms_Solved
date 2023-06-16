import Foundation

func permute(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    var visited = Array(repeating: false, count: nums.count)
    
    func permutation(_ nowPermute: [Int]) {
        if nowPermute.count == targetNum {
            result.append(nowPermute)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == true {
                continue
            }
            else {
                visited[i] = true
                permutation(nowPermute + [nums[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var k1 = k
    let index = Array(0..<dungeons.count)
    let perm = permute(index, dungeons.count)
    for i in perm {
        var cnt = 0
        k1 = k
        for j in i {
            if dungeons[j][0] <= k1 {
                if k1 - dungeons[j][1] >= 0 {
                    cnt += 1
                    k1 -= dungeons[j][1]
                }
            }
            
        }
        if result < cnt {
            result = cnt
        }
    }
    return result
}