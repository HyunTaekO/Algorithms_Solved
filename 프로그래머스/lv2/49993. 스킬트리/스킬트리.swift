import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skill = skill.map{ String($0) }
    var result = 0
    for str in skill_trees {
        var tree = Array(str.split(whereSeparator: { !skill.contains(String($0)) }).joined().map{ String($0) }.reversed())
        
        if tree.count == 0 { result += 1; continue }
        
        var check = false
        for i in 0..<tree.count {
            let last = tree.removeLast()
            if skill[i] == last{
                check = true
                continue
            }else {
                check = false
                break
            }
        }
    
        if check { result += 1 }
    }
    return result
}