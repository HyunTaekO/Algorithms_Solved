import Foundation
let n = Int(readLine()!)!
var pan = Array(repeating: Array<String>(), count: n)
var heart = (0, 0)
var body: [Int] = []
for i in 0..<n {
    let input = readLine()!.map{ String($0) }
    pan[i] = input
}

for i in 0..<n {
    for j in 0..<n {
        if pan[i][j] == "*" {
            heart = (i+1, j)
            break
        }
    }
    guard heart == (0, 0) else{ break }
}
var cnt = 0
for left in stride(from: heart.1 - 1, through: 0, by: -1) {
    if pan[heart.0][left] == "*" {
        cnt += 1
        if left == 0 {
            body.append(cnt)
            cnt = 0
            break
        }
    }else {
        body.append(cnt)
        cnt = 0
        break
    }
}
for right in stride(from: heart.1 + 1, through: n - 1, by: 1) {
    if pan[heart.0][right] == "*" {
        cnt += 1
        if right == n - 1 {
            body.append(cnt)
            cnt = 0
            break
        }
    }else {
        body.append(cnt)
        cnt = 0
        break
    }
}
for waist in stride(from: heart.0 + 1, through: n - 1, by: 1) {
    if pan[waist][heart.1] == "*" {
        cnt += 1
        if waist == n - 1 {
            body.append(cnt)
            cnt = 0
            leg((waist, heart.1))
            break
        }
    }else {
        body.append(cnt)
        cnt = 0
        leg((waist-1, heart.1))
        break
    }
}
func leg(_ waist: (Int, Int)) {
    for left in stride(from: waist.0 + 1, through: n - 1, by: 1) {
        if pan[left][waist.1-1] == "*" {
            cnt += 1
            if left == n - 1 {
                body.append(cnt)
                cnt = 0
                break
            }
        }else {
            body.append(cnt)
            cnt = 0
            break
        }
    }
    for right in stride(from: waist.0 + 1, through: n - 1, by: 1) {
        if pan[right][waist.1+1] == "*" {
            cnt += 1
            if right == n - 1 {
                body.append(cnt)
                cnt = 0
                break
            }
        }else {
            body.append(cnt)
            cnt = 0
            break
        }
    }
}
print(heart.0+1, heart.1+1)
print(body.map{String($0)}.joined(separator: " "))