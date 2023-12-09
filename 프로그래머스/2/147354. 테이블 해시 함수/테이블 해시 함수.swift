import Foundation


func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    // col번째 컬럼 기준 오름차순, 동일한 경우 첫번째 컬럼 기준 내림차순
    var table = data.sorted(by: { (f, s) in 
                                    if f[col-1] == s[col-1] {
                                        return f[0] > s[0]
                                    }else {
                                        return f[col-1] < s[col-1]
                                    }
                                })
    var result = 0
    
    for i in 0..<table.count where row_begin...row_end ~= (i+1) {
        let s = table[i].map{ $0 % (i+1) }.reduce(0, +)
        result ^= s
    }
    
    return result
}

