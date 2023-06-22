import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = nm[0]
let M = nm[1]
var nnArr: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
var mArr: [[Int]] = Array(repeating: [], count: M)
for i in 0..<N {
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    nnArr[i][0] = arr[0]
    for j in 1..<arr.count{
        nnArr[i][j] = nnArr[i][j-1] + arr[j]
    }
}
for i in 0..<M {
    mArr[i] = readLine()!.split(separator: " ").map{ Int(String($0))!-1 }
}
for i in 1..<N {
    for j in 0..<N {
        nnArr[i][j] += nnArr[i-1][j]
    }
}
for i in mArr {
    var r = nnArr[i[2]][i[3]]
    var x = -1
    var y = -1
    if i[1]-1 >= 0 {
        r = r - nnArr[i[2]][i[1]-1]
        y = i[1]-1
    }
    if i[0] - 1 >= 0 {
        r = r - nnArr[i[0]-1][i[3]]
        x = i[0]-1
    }
    if x == -1 || y == -1 {
        print(r)
    }else {
        r += nnArr[x][y]
        print(r)
    }
}