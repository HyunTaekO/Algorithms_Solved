import Foundation

func solution(_ s:String) -> [Int] {
    var numbers = Array(repeating: false, count: 100001)
    var arr = s.split{$0 == "}"}.map{String($0)}
    var trans = arr.map{$0.split{$0 == "," || $0 == "{"}.map{Int(String($0))!}}
    trans = trans.sorted(by: {$0.count < $1.count})
    var result: [Int] = []
    for t in trans {
        for n in t {
          if !numbers[n] {
              result.append(n)
              numbers[n] = true
          }    
        }
    }
    return result
}