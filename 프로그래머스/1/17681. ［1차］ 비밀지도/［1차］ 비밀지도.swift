func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in 0..<arr1.count {
        let a = fill(String(arr1[i], radix: 2), n)
        let b = fill(String(arr2[i], radix: 2), n)
        answer.append(trans(a, b))
    }
    return answer
}

func trans(_ a: String,_ b: String) -> String {
    var result: String = ""
    for (i, j) in zip(a, b) {
        if i == "1" || j == "1" {
            result += "#"
        }else {
            result += " "
        }
    }
    return result
}

func fill(_ n: String,_ k: Int) -> String {
    var result = n
    while result.count < k {
        result = "0" + result
    }
    return result
}