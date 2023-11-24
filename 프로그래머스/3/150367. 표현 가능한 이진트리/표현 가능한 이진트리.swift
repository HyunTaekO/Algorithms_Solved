import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    var result: [Int] = []
    
    for number in numbers {
        guard number > 0 else{ result.append(0); continue }
        let num = String(number, radix: 2) // 10진수 -> 2진수 변환
        let n = findHight(num.count) // 트리 높이
        let tree = fillZero(num, Double(n)) 
        result.append(rounds(tree, n))
    }
    return result
}

func rounds(_ tree: [Bool],_ hight: Int) -> Int {
    let root = tree.count / 2
    var gap = 0
    var flag = true
    func dfs(_ depth: Double,_ parent: Int) {
        if depth == 0 || !flag { return }
        gap = Int(pow(2.0, depth - 2.0))
        let left = parent - gap
        let right = parent + gap
        if !tree[parent] {
            if tree[left] || tree[right] { flag = false; return }
        }
        dfs(depth-1, left)
        dfs(depth-1, right)
    }
    dfs(Double(hight), root)
    return flag ? 1 : 0
}

func fillZero(_ num: String,_ n: Double) -> [Bool] {
    var num = num
    while num.count < Int(pow(2.0, n)-1) {
        num = "0" + num
    }
    return num.map{ $0 == "1" ? true : false } 
}

func findHight(_ len: Int) -> Int {
    var hight = 0
    for i in 0..<10000 {
        if Double(len) < pow(2.0, Double(i)) {
            hight = i
            break
        }
    }
    return hight
}