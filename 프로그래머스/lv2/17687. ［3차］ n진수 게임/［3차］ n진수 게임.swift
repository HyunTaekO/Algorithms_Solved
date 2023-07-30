func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var nums: [String] = []
    var result = ""
    var cnt = 0
    while true {
        let num = String(cnt, radix: n).map{ String($0).uppercased() }
        nums += num
        if nums.count / m >= t {
            break
        }
        cnt += 1
    }
    for i in stride(from: p-1, to: nums.count, by: m) {
        result += nums[i]
        if result.count == t {
            break
        }
    }
   
    return result
}