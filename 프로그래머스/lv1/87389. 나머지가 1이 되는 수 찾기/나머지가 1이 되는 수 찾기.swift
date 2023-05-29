import Foundation

func solution(_ n:Int) -> Int {
    guard 3 <= n && n <= 1000000 else { return -1 }
    
    for x in 2..<n {
        if n % x == 1 {
            return x
        }
        
    }
    
    return 0
}