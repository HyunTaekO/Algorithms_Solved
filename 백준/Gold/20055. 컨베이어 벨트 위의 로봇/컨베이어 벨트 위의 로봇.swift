import Foundation

let input1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input1[0]
let K = input1[1]
var shield = readLine()!.split(separator: " ").map{ Int(String($0))! }
var robot = Array(repeating: false, count: N)
var result = 0
while true {
    result += 1
    //벨트 1회전
    let l = shield.removeLast()
    shield.insert(l, at: 0)
    //로봇 1회전
    robot.removeLast()
    robot.insert(false, at: 0)
    
    //로봇 이동
    for i in stride(from: robot.count-2, through: 0, by: -1) {
        if robot[robot.count-1] == true { robot[robot.count-1] = false }
        if shield[i+1] > 0 && robot[i+1] == false && robot[i] == true {
            robot[i+1] = robot[i]
            robot[i] = false
            shield[i+1] -= 1
            
        }
    }
    
    //로봇 올리기
    if shield[0] > 0 {
        robot[0] = true
        shield[0] -= 1
    }
    
    if shield.filter({ $0 == 0 }).count >= K {
        break
    }
  
}
print(result)