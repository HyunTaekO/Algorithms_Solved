import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    var c = s.count
    var s = s
    for l in 0..<c {
        if let last = stack.last {
            if last == s.last! {
                stack.popLast()
                s.removeLast()
            }else {
                stack.append(s.last!)
                s.removeLast()
            }
        }else {
            stack.append(s.last!)
            s.removeLast()
        }
    }
    
    return stack.isEmpty ? 1 : 0
}