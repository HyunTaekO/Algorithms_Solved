import Foundation

// 이진탐색 사용
// mid 명 일 때 건널 수 있는지 판단 
// 건널수 있다면 오른쪽으로 진행, 없다면 왼쪽 진행

func solution(_ stones:[Int], _ k:Int) -> Int {
    var left = 1
    var right = 200000000
    
    while left < right {
        let mid = (left + right) / 2
        var count = 0
        for i in 0..<stones.count {
            
            if stones[i] - mid <= 0 {
                count += 1
                
                if count >= k {
                    break
                }
            } else {
                count = 0
            }
        }
        
        if count >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}