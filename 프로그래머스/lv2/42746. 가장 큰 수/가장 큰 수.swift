
func solution(_ numbers:[Int]) -> String {
    let sorted = numbers.sorted(by: { second, first in 
                                        let f = String(first)
                                        let s = String(second)
                                        return Int(f+s)! >= Int(s+f)! ? false : true
                                    })
    if sorted[0] == 0 {
        return "0"
    }
    let result = sorted.map{ String($0) }.joined()
    
    return result
}