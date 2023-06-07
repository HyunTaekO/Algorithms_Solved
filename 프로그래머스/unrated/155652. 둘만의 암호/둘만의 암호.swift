import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let sk = skip.map{ String($0) }
    var result = s.map{ String($0) }
    var str = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t","u","v","w","x","y","z"].filter{ !sk.contains($0)}
    print(str, result, sk)
    
    for i in 0..<result.count {
        let fIndex = str.firstIndex(of: result[i])!
        // if fIndex + index >= str.endIndex {
        //     let eIndex = index - (str.endIndex - fIndex)
        //     result[i] = str[eIndex]
        // }else {
        //     result[i] = str[fIndex + index]
        // }
        result[i] = str[(fIndex + index)%str.count]
        
    }
    return result.joined()
}
