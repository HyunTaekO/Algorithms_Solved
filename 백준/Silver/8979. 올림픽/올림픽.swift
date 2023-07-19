let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nk[0]
let k = nk[1]
var country = Array(repeating: Array(repeating: 0, count: 4), count: n)
var rank = 1
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    country[i] = input
}
if country[0][1] == country[1][1] && country[0][2] == country[1][2] && country[0][3] == country[1][3] {
    print("1")
}else {
    if country[0][0] == n {
        print("1")
    }else {
        print("2")
    }
}