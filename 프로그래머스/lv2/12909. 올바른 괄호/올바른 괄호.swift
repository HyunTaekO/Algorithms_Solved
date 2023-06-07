import Foundation

func solution(_ s:String) -> Bool
{
    var cnt = 0
    for i in s {
        if i == "(" {
            cnt += 1
        }else {
            cnt -= 1
        }
        if cnt < 0 {
            return false
        }
    }
    
    

    return cnt == 0 ? true : false
}