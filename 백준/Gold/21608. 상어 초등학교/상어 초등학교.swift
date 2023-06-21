import Foundation
let N = Int(readLine()!)!
var classR = Array(repeating: Array(repeating: 0, count: N), count: N)
var students: [[Int]] = Array(repeating: [], count: N*N)
for i in 0..<N*N {
    students[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

let dx = [-1, 0, 0, 1]
let dy = [0, -1, 1, 0]
var result: [Int] = []
var dic: [Int: [Int]] = [:]
for stu in 0..<students.count {
    let student = students[stu].remove(at: 0)
    var rocation: [[Int]] = [] // 최적 위치
    for x in 0..<N {
        for y in 0..<N {
            
            var zero = 0
            var favor = 0
            if classR[x][y] != 0 { continue }
            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
                if nx < 0 || ny < 0 || nx >= N || ny >= N {continue}
                if classR[nx][ny] == 0 {
                    zero += 1
                }else if students[stu].contains(classR[nx][ny]) {
                    favor += 1
                }
            }
            
            rocation.append([favor, zero, x, y])

        }
        
    }
    
    rocation = rocation.sorted(by: { ($0[0], $0[1], -$0[2], -$0[3]) > ($1[0], $1[1], -$1[2], -$1[3]) })
    //print(rocation)
    dic[student] = students[stu]
    classR[rocation[0][2]][rocation[0][3]] = student
    
}
//print(classR)
for x in 0..<classR.count {
    for y in 0..<classR[x].count {
        var cnt = 0
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            if nx < 0 || ny < 0 || nx >= N || ny >= N {continue}
            if dic[classR[x][y]]!.contains(classR[nx][ny]) {
                cnt += 1
            }
        }
        if cnt == 1 {
            result.append(1)
        }else if cnt == 2 {
            result.append(10)
        }else if cnt == 3 {
            result.append(100)
        }else if cnt == 4 {
            result.append(1000)
        }
    }
}
if result.isEmpty {
    print(0)
}else {
    print(result.reduce(0, +))
}