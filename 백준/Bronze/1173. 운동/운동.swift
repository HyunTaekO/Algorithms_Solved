import Foundation

let NmMTR = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let N = NmMTR[0]
let m = NmMTR[1]
let M = NmMTR[2]
let T = NmMTR[3]
let R = NmMTR[4]

var cnt = 0
var exe = 0
var X = m
if m + T > M {
    print("-1")
}else {
    while true {
        cnt += 1
        if X + T <= M {
            exe += 1
            if exe == N { break }
            X += T
        }else {
            if X - R < m {
                X = m
            }else {
                X -= R
            }
        }
    }
    print(cnt)
}