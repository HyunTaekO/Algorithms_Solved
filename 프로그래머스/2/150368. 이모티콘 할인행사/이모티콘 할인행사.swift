import Foundation
// 18:43 ~ 
// 할인율의 조합 구하기 [10, 20, 30, 40]
// 할인율의 조합을 순회하면서 구매액과 서비스 가입 여부를 체크한다.

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let discounts = discountCombination(emoticons.count)
    var result: [Int] = [0, 0]
    
    for discount in discounts {
        var (service, sumP) = (0, 0) 
       
        for user in users {
            let (dis, price) = (user[0], user[1])
            var p = 0
            for i in 0..<discount.count {
                if dis <= discount[i] {
                    p += sale(emoticons[i], discount[i])
                }
            }
            
            if price <= p {
                service += 1
            }else {
                sumP += p
            }
            
        }
        if result[0] < service {
            result = [service, sumP]
        }else if result[0] == service && result[1] < sumP {
            result = [service, sumP]
        }
     }
    
    return result
}

func sale(_ price: Int,_ discount: Int) -> Int {
    return price - ((price / 100) * discount)
} 

func discountCombination(_ n: Int) -> [[Int]] {
    let arr = [10, 20, 30, 40]
    var result: [[Int]] = []
    
    func combi(_ now: [Int]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in 0..<arr.count {
            combi(now + [arr[i]])
        }
    }
    combi([])
    return result
}