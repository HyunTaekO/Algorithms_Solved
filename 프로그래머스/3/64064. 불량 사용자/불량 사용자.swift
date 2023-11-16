import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = 0
    var user: [[Int]] = Array(repeating: Array<Int>(), count: banned_id.count)
 
    return combination(user_id, banned_id)
}

func combination(_ userArr: [String],_ banned_id:[String]) -> Int {
    var resultArr: Set<[String]> = []
    var result = 0
    var visited = Array(repeating: false, count: userArr.count)
    
    func combi(_ index: Int, _ now: [String]) {
        if now.count == banned_id.count {
            let arr = now.sorted(by: <)
            resultArr.update(with: arr)
            return
        }
        for i in 0..<userArr.count where i != index {
            if isPosible(userArr[i], banned_id[now.count]) && !visited[i] {
                visited[i] = true
                combi(i, now + [userArr[i]])
                visited[i] = false
            }
        }
    
    }
    combi(-1, [])
    return resultArr.count
}
func isPosible(_ user: String,_ banned: String) -> Bool {
    guard user.count == banned.count else{ return false }
    
    let u = user.map{String($0)}
    let b = banned.map{String($0)}
    
    for i in 0..<user.count {
        if b[i] == "*" || u[i] == b[i] { continue }
        return false
    }
    
    return true
}