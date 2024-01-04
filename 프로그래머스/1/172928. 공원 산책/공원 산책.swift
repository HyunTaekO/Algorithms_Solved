import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var roc = [0, 0]
    let park = park.map{ $0.map{$0} }
    var fl = false
    for i in 0..<park.count {
        for j in 0..<park[0].count {
            if park[i][j] == "S" {
                roc = [i, j]
                fl = true
                break
            }
        }
        if fl { break }
    }
    
    for route in routes {
        let r = route.split{$0 == " "}.map{$0}
        let (dir, n) = (r[0], Int(r[1])!)
        var (i, j) = (roc[0], roc[1])
        var flag = false
        for x in 1...n {
            switch dir {
                case "E":
                j += 1
                case "W":
                j -= 1
                case "S":
                i += 1
                default:
                i -= 1
            }
            guard 0..<park.count ~= i && 0..<park[0].count ~= j && park[i][j] != "X" 
            else{ flag = false; break} 
            flag = true
        }
        
        if flag { roc = [i, j] }
    }
    return roc
}


