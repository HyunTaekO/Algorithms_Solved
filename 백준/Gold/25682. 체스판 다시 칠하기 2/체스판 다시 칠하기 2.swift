import Foundation

let NMK = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = NMK[0]
let m = NMK[1]
let k = NMK[2]
var map = Array(repeating: Array<Character>(), count: n)

for i in 0..<n {
    let input = readLine()!.map{ $0 }
    map[i] = input
}
func compare(_ color: Character) -> [[Int]] {
    var compareMap = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
    var check = 0
    for i in 0..<n {
        for j in 0..<m {
            if (i + j) % 2 == 0 {
                check = map[i][j] == color ? 0 : 1
            }else {
                check = map[i][j] != color ? 0 : 1
            }
            compareMap[i + 1][j + 1] = compareMap[i][j + 1] + compareMap[i + 1][j] - compareMap[i][j] + check
        }
    }
    return compareMap
}
func sum(_ compareMap: [[Int]]) -> Int {
    var result = Int.max
    for i in 1...(n - k + 1) {
        for j in 1...(m - k + 1) {
            let count = compareMap[i + k - 1][j + k - 1] - compareMap[i - 1][j + k - 1] - compareMap[i + k - 1][j - 1] + compareMap[i - 1][j - 1]
            result = min(result, count)
        }
    }
    return result
}
print(min(sum(compare("B")), sum(compare("W"))))