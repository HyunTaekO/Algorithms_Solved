import Foundation

func solution(_ number:[Int]) -> Int {
    var sum = 0
    var result = 0
    for v in number.indices {
        
        
        for i in number.indices where i > v {
            
            for j in number.indices where j > i {
                
                sum = number[v] + number[i] + number[j]
                if sum == 0 {
                    result += 1
                    print(number[v], number[i], number[j] )
                    continue
                }
                
            }
            
        }
        
    }
    return result
}