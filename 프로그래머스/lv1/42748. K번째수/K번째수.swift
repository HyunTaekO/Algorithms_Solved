import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for i in commands {
        let arr = Array(array[(i[0]-1)..<i[1]]).sorted()
        result.append(arr[i[2]-1])
    }
    return result
}