import Foundation

func solution(_ name:String) -> Int {
    if Set(name).count == 1  { return 0 }
    
    let us = Array(65..<91).map{ Character(Unicode.Scalar($0)!) }
    var dic: [Character: Int] = us.reduce(into: [:]) { $0[$1] = min(Int(exactly: UnicodeScalar(String($1))!.value)! - 65, abs(Int(exactly: UnicodeScalar(String($1))!.value)! - 91)) }
    
    var updown = 0
    var move = name.count - 1
    var name = name.map{$0}
    for i in 0..<name.count {
        updown += dic[name[i]]! // 위아래 조작
        if name[i] != "A" {
            var next = i + 1
            while next < name.count && name[next] == "A" {
                next += 1
            }
            let moveFront = i * 2 + (name.count - next)
            let moveBack = (name.count - next) * 2 + i
            move = min(moveFront, moveBack, move)
        }
    }
    return updown + move
}

