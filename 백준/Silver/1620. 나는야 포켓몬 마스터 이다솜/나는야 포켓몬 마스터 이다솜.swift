import Foundation

let nm = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr: [String] = []
var dic: [String: String] = [:]
var question: [String] = []
for _ in 0..<n {
    let input = readLine()!
    arr.append(input)
    dic.updateValue(String(arr.count), forKey: input)
}

for _ in 0..<m {
    question.append(readLine()!)
}

question.forEach{ q in
    if let number = Int(q) {
        print(arr[number-1])
    }else {
        print(dic[q]!)
    }
}
