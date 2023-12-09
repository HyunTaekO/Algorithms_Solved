import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    if a == b && b == c && c == d { return 1111 * a } // 네 주사위가 같을 때
    let arr = [a, b, c, d]
    let hash = Set(arr)
    if hash.count == 2 { 
        for n in hash {
            //세 주사위 == p 나머지 주사위 != p 일 때
            if arr.filter({$0 == n}).count == 3 { 
                let q = arr.filter{ $0 != n }.first!
                return (10 * n + q) * (10 * n + q)
            }
            // 두 개씩 같은 값 일 때
            if arr.filter({$0 == n}).count == 2 {
                let q = arr.filter{ $0 != n }.last!
                return (n + q) * (abs(n - q))
            }
        }
    }
    if hash.count == 3 {
        for p in hash {
            if arr.filter({$0 == p}).count == 2 {
                return arr.filter{$0 != p}.reduce(1, *)
            }
        }
    }
    
    return arr.min()!
}