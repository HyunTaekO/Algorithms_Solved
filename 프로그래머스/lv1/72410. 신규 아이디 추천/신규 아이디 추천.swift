import Foundation
func lv2(_ id: String) -> String {
    guard id != "" else { return id }
    var copyId = id
    for v in copyId {
        if v.isNumber == true || v.isLowercase == true || v == "-" || v == "_" || v == "." {
            continue
        }else {
            copyId.remove(at: copyId.firstIndex(of: v)!)
        }
    } 
    return copyId
}
func lv3(_ id: String) -> String {
    guard id != "" else { return id }
    var copyId = id
    while copyId.contains("..") {
        copyId = copyId.replacingOccurrences(of: "..", with: ".")
    }
    
    return copyId
}
func lv4(_ id: String) -> String {
    guard id != "" else { return id }
    var copyId = id
    if copyId.hasPrefix(".") {
        copyId.removeFirst()
    }
    if copyId.hasSuffix(".") {
        copyId.removeLast()
    }
    return copyId
}

func lv5(_ id: String) -> String {
    return id == "" ? "a" : id
}
func lv6(_ id: String) -> String {
    if id.count > 15 {
        let range = id.startIndex..<id.index(id.startIndex, offsetBy: 15)
        return lv4(String(id[range]))
    }
    return id
}
func lv7(_ id: String) -> String {
    guard id.count < 3 else {return id} 
    var copyId = id
    let plus = String(id[id.index(before: id.endIndex)])
    if id.count == 1 {
        copyId += plus + plus
    }else if id.count == 2 {
        copyId += plus
    }
    return copyId
}
func solution(_ new_id:String) -> String {
    var id = new_id.lowercased() // 1단계
    id = lv2(id)
    id = lv3(id)
    id = lv4(id)
    id = lv5(id)
    id = lv6(id)
    id = lv7(id)
    return id
}
