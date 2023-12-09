import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var result = 0
    var left = 1
    var right = times.max()! * n
    
    while left <= right {
        let mid = (left + right) / 2
        var cnt = 0
        
        for time in times {
            cnt += mid / time
            if cnt >= n {
                break
            }
        }
        
        if cnt >= n {
            result = mid
            right = mid - 1
        }else {
            left = mid + 1
        }
    }
    return Int64(result)
}