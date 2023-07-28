func solution(_ str1:String, _ str2:String) -> Int {
    var dic: [String: (Int, Int)] = [:]
    let filterStr1 = str1.lowercased()
    let filterStr2 = str2.lowercased()
    var str1 = fil(filterStr1)
    var str2 = fil(filterStr2)
    for i in str1 {
        guard i.split(whereSeparator: { !$0.isLetter }).joined().count == 2 else{ continue }
        if let d = dic[i] {
            dic[i] = (d.0+1, 0)
        }else {
            dic[i] = (1, 0)
        }
    }
    for i in str2.filter({ $0.count == 2}) {
        guard i.split(whereSeparator: { !$0.isLetter }).joined().count == 2 else{ continue }
        if let d = dic[i] {
            dic[i]!.1 = d.1 + 1
        }else {
            dic[i] = (0, 1)
        }
    }
    let same = dic.values.map{ min($0.0, $0.1) }.reduce(0, +)
    let sum = dic.values.map{ max($0.0, $0.1) }.reduce(0, +)
    guard same != 0 || sum != 0 else { return 65536}
    return Int(Double(same) / Double(sum) * 65536)
}

func fil(_ str: String) -> [String] {
    return stride(from: 0, to: str.count, by: 1).map { index -> String in
        let startIndex = str.index(str.startIndex, offsetBy: index)
        let endIndex = str.index(startIndex, offsetBy: 2, limitedBy: str.endIndex) ?? str.endIndex
        return String(str[startIndex..<endIndex])
    }
}