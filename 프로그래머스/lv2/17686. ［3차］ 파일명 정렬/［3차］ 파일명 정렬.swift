func solution(_ files:[String]) -> [String] {
    let number = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var splitFiles = files.map{ str -> [String] in 
                        let head = str.split(whereSeparator: {$0.isNumber}).map{ String($0) }[0] 
                        let number = str.split(whereSeparator: {$0.isLetter || $0 == "." || $0 == " " || $0 == "-"})
                                        .map{ String($0) }[0]
                                return [head, number, str]
                              }
    let result = splitFiles.sorted(by: { ($0[0].lowercased(), Int($0[1])!) < ($1[0].lowercased(), Int($1[1])!)})
                            .map{ $0[2] }
    return result
}