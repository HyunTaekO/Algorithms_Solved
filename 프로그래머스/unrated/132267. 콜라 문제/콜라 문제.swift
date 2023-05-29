import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    var nn = n
    var result = 0
    while nn >= a {
        let c = nn / a
        nn += (b * (c))
        result += (b * (c))
        nn -= (a * (c))
        print(nn, result)
        if nn < a {
            break
        }
    }
    
    return result
}