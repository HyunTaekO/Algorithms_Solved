let t = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append(input)
}
for testcase in arr {
    var students: [Int] = []
    var result = 0
    students.append(testcase[1])
    for i in 2..<testcase.count {
        let taller = students.filter{ $0 > testcase[i] }
        if taller.count == 0 {
            students.append(testcase[i])
            continue
        }else {
            result += taller.count
            students.insert(testcase[i], at: students.lastIndex(of: taller[0])!)
        }
    }
    print(testcase[0], result)
}