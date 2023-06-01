import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var result: [String] = []
    
    for i in 0...9 {
        let cntX = X.filter{ String($0) == String(i) }.count
        let cntY = Y.filter{ String($0) == String(i) }.count
        
        result += Array(repeating: String(i),count: min(cntX, cntY))
    }
    
    return result.isEmpty ? "-1" : result.filter{ $0 == "0"}.count == result.count ? "0" : result.sorted(by: >).joined()
}