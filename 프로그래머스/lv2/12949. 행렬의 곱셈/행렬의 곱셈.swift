import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    for index in 0..<arr1.count {
        for y in 0..<arr2[0].count {
            var temp = 0
            for x in 0..<arr2.count {
                temp += arr1[index][x] * arr2[x][y]
            }
            result[index][y] = temp
        }
    }
    return result
}