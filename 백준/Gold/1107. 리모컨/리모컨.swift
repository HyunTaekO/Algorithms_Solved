import Foundation

let n = Int(readLine()!)!
let wrong = Int(readLine()!)!
var wrongBtns: [Int] = []


if wrong > 0 {
    wrongBtns = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
}
var minCnt = abs(n - 100)

for i in 0...10000000 {
    let len = check(i)
    if len > 0 {
        let press = abs(n-i)
        minCnt = min(minCnt, len + press)
    }
}

print(minCnt)

func check(_ i: Int) -> Int {
    var n = i
    
    if n == 0 {
        return wrongBtns.contains(0) ? 0 : 1
    }
    
    var len = 0
    
    while n > 0 {
        if wrongBtns.contains(n % 10) {return 0}
        n = n / 10
        len += 1
    }
    
    return len
}

