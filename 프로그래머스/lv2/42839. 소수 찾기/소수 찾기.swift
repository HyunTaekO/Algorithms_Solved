import Foundation
func prime(_ n: Int) -> Bool {
    guard n >= 2 else { return false }
    for i in 2..<n {
        if n % i == 0 {
            return false
        }
    }
    return true
}
func permutation(_ array: [String],_ n: Int) -> [Int] {
    var result: [String] = []
    var visited = Array(repeating: false, count: array.count)
    
    func permutation(current: [String]) {
        if current.count == n {
            result.append(current.joined())
            return
        }
        
        for i in 0..<array.count {
            if !visited[i] {
                visited[i] = true
                permutation(current: current + [array[i]])
                visited[i] = false
            }
        }
    }
    permutation(current: [])
    return result.map{ Int(String($0))! }
}
func solution(_ numbers:String) -> Int {
    var numArr = numbers.map{ String($0) }
    var arr: Set<Int> = []
    var result = 0
    for i in 1...numbers.count {
        for j in permutation(numArr, i) {
            arr.update(with: j)
        }
    }
    result = arr.count
    for i in arr.indices {
        if prime(arr[i]) {
            continue
        }else {
            result -= 1
        }
    }
    return result
}