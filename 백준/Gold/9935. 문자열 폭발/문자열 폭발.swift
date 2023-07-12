var str = readLine()!.map{ String($0) }
let boom = readLine()!.map{ String($0) }
let len = boom.count
var check: [String] = []
for i in str {
    check.append(i)
    if i == boom.last && check.count >= len && Array(check[check.endIndex-len...check.endIndex-1]) == boom {
        check.removeLast(len)
    }
}

if check.isEmpty {print("FRULA")}else{ print(check.joined()) }