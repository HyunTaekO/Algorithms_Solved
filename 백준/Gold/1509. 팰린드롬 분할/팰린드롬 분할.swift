import Foundation

var str = readLine()!.map{ String($0) }
var idx = 0
var result = 0
let size = str.count

var isPal = Array(repeating: Array(repeating: false, count: size), count: size)
func checkPal(_ startIndex: Int,_ endIndex: Int) {
    var startIndex = startIndex
    var endIndex = endIndex
    
    while 0 <= startIndex && endIndex < size && str[startIndex] == str[endIndex] {
        isPal[startIndex][endIndex] = true
        startIndex -= 1
        endIndex += 1
    }
}
func getPal() {
    
    for startIndex in 0..<size {
        checkPal(startIndex, startIndex)
        checkPal(startIndex, startIndex + 1)
    }

}
getPal()
var dp = Array(repeating: 1, count: size)

for rightIndex in 1..<size {
    dp[rightIndex] = dp[rightIndex - 1] + 1
    for leftIndex in 0..<rightIndex {
        if isPal[leftIndex][rightIndex] {
            if leftIndex == 0 {
                dp[rightIndex] = 1
                break
            }else {
                dp[rightIndex] = min(dp[rightIndex], dp[leftIndex - 1] + 1)
            }
        }
    }
}
print(dp[size-1])