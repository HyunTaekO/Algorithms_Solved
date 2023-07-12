let n = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp: [Int] = [numArr[0]]
func search(_ find: Int,_ numArr: [Int]) -> Int {
    var start = 0
    var end = numArr.count-1
    var mid = (start + end) / 2
    
    while start < end {
        mid = (start + end) / 2
        if numArr[mid] < find {
            start = mid + 1
        }else {
            end = mid
        }
    }
    
    return end
}
for i in 0..<n {
    if dp[dp.count - 1] < numArr[i] {
        dp.append(numArr[i])
    }else if dp[dp.count - 1] > numArr[i]{
        let index = search(numArr[i], dp)
        dp[index] = numArr[i]
    }
}
print(dp.count)