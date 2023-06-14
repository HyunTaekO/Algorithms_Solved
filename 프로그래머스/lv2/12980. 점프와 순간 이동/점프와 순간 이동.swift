import Foundation

func solution(_ n:Int) -> Int 
{
    var k = 0
    var nn = n
    while nn > 0 {
        k += nn % 2
        nn = (nn % 2) == 0 ? nn / 2 : nn - 1
    }
    return k
}