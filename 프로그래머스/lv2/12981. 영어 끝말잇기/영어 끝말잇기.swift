import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var people = Array(repeating: 0, count: n)
    var number = 0
    var str: [String] = []
    for (i, v) in words.enumerated() {
        number += 1
        if number > n {
            number = 1
        }
        people[number-1] += 1
        if i != 0 {
            if v.first! != words[i-1].last! {
                return [number, people[number-1]]
            }else if str.contains(v) {
                return [number, people[number-1]]
            }
           
        }
        str.append(v)
        
    }
    return [0, 0]
}