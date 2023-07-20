import Foundation
let n = Int(readLine()!)!
var swc = readLine()!.components(separatedBy: " ").map{ $0 == "1" ? true: false }
var students: [[Int]] = []
let sn = Int(readLine()!)!
for _ in 0..<sn {
    let input = readLine()!.components(separatedBy: " ").map{ Int(String($0))! }
    students.append(input)
}
func men(swit: [Bool], num: Int) -> [Bool] {
    return swit.enumerated().map{ ($0.offset+1) % num == 0 ? !$0.element : $0.element }
}
func women(swit: [Bool], num: Int) -> [Bool] {
    var result = swit
    result[num-1] = !result[num-1]
    var cnt = 0
    while true {
        cnt += 1
        let leftIndex = (num-1) - cnt
        let rightIndex = (num-1) + cnt
        guard leftIndex >= 0 && rightIndex < n else{ break }
        if result[leftIndex] == result[rightIndex] {
            result[leftIndex] = !result[leftIndex]
            result[rightIndex] = !result[rightIndex]
        }else {
            break
        }
    }
    return result
}
for student in students {
    let gender = student[0]
    let number = student[1]
    if gender == 1 {
        swc = men(swit: swc, num: number)
    }else {
        swc = women(swit: swc, num: number)
    }
}
var answer = swc.map{ $0 ? "1" : "0" }.joined()
var cnt = 0
for a in answer {
    cnt += 1
    if cnt == 20 {
        cnt = 0
        print(a, terminator: "\n")
    }else {
        print(a, terminator: " ")
    }
}