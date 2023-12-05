import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let cnt = number.count
    var k = k
    var stack: [Character] = []
    
    for n in number {
        while !stack.isEmpty && k > 0 && stack.last!.wholeNumberValue! < n.wholeNumberValue! {
            stack.removeLast()
            k -= 1
        }
        
        if stack.count < cnt - k {
            stack.append(n)
        }
    }
    return String(stack)
}