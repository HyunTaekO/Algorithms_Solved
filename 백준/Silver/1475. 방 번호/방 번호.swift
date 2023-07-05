let n = readLine()!.map{ Int(String($0))! }
var dic: [Int: Int] = [:]
for i in n {
    if let d = dic[i] {
        dic[i] = d + 1
    }else {
        dic[i] = 1
    }
}
var ns = 0
if let nine = dic[9] {
    ns += nine
}
if let six = dic[6] {
    ns += six
}
if ns > 0 {
    dic[9] = ns/2 + ns%2
    dic[6] = ns/2 + ns%2
}
var m = dic.values.max()!

if m == 1 {
    print("1")
}else {
    print(m)
}