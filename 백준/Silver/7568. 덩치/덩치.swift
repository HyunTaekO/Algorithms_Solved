let n = Int(readLine()!)!
var people: [[Int]] = []
var answer = Array(repeating: 0, count: n)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    people.append(input)
}
for i in 0..<n {
    let weight = people[i][0]
    let height = people[i][1]
    answer[i] = people.filter{ $0[0] > weight && $0[1] > height }.count + 1
}
print(answer.map{ String($0) }.joined(separator: " "))