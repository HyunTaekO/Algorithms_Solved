import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    if arr.count == arr[0].count { return arr }
    if arr.count > arr[0].count { return arr.map({ $0 + Array(repeating: 0, count: arr.count - arr[0].count) })}
    return arr + Array(repeating: Array(repeating: 0, count: arr[0].count), count: arr[0].count - arr.count)
}