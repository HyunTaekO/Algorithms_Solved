var str = readLine()!.map{ String($0) }
var len = str.filter({ $0 == "a"}).count
var answer = Int.max
str += str
for i in 0..<str.count-len {
    let swapCnt = str[i..<len].filter{ $0 == "b"}.count
    answer = min(answer, swapCnt)
    len += 1
}
print(answer)