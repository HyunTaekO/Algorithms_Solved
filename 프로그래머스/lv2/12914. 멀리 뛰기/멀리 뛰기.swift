func solution(_ n:Int) -> Int {
    var block: [Int] = [0, 1, 2]
    guard n > 2 else { return n}
    for index in 3...n {
        
        let cases = (block[index-1] + block[index-2]) % 1234567
        block.append(cases)
    }
    return block[n]
}

