var input: [Int] = []
for _ in 1...3 {
    if let n = readLine(), let number = Int(n) {
        input.append(number)
    }
}
func numCount() {
    var dic: [String: Int] = ["0": 0, "1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0, "8": 0, "9": 0]
    let calculated = input[0] * input[1] * input[2]
    for i in String(calculated) {
        dic[String(i)]! += 1
    }
    for c in dic.keys.sorted() {
        print(dic[c]!)
    }
}
numCount()