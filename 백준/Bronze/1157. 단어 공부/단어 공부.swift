let word = readLine()!.split(separator: " ").joined().uppercased()
var dic: [String: Int] = [:]
for w in word {
    let s = String(w)
    if let d = dic[s] {
        dic[s] = d + 1
    }else {
        dic[s] = 1
    }
}
var max = dic.values.max() ?? 0
if dic.filter({ $0.value == max }).count == 1 {
    print(dic.filter({ $0.value == max }).keys.first!)
}else { print("?") }