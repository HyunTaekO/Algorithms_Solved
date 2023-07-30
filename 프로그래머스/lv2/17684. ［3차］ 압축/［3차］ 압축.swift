func solution(_ msg:String) -> [Int] {
    var result: [Int] = [] // 출력결과
    var input = "" //현재 입력
    var curN = 0
    let nums = Array(1...26)
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var dic = Dictionary(uniqueKeysWithValues: zip(alphabet, nums)) //사전
    for c in msg {
        input += String(c)
        if let number = dic[input] {
            curN = number
            continue
        }else {
            result.append(curN)
            curN = dic[String(c)]!
            dic[input] = dic.values.max()! + 1
            input = String(c)
        }
    }
    
    result.append(dic[input]!)
    return result
}