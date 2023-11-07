var temp = 0.0
var sum = 0.0
var inputArr: [Double] = []
for _ in 0..<20 {
    var input = readLine()!.split(separator: " ").map{ String($0) }
    switch input[2] {
    case "A+":
        temp = 4.5
    case "A0":
        temp = 4.0
    case "B+":
        temp = 3.5
    case "B0":
        temp = 3.0
    case "C+":
        temp = 2.5
    case "C0":
        temp = 2.0
    case "D+":
        temp = 1.5
    case "D0":
        temp = 1.0
    case "F":
        temp = 0.0
    default:
        continue
    }
    sum += Double(input[1])!
    inputArr.append(Double(input[1])! * temp)
}
print(Float(inputArr.reduce(0, +) / sum))