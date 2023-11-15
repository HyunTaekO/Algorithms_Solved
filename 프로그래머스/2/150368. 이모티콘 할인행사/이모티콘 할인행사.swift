import Foundation
// 1. 할인율의 가능한 조합을 구한다.
// 2. 구한 조합을 하나씩 확인하며 서비스 가입자와 판매액이 최대가 되는 조합 한개를 찾는다.
var user: [[Int]] = []

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    user = users
    let discounts = combination([1, 2, 3, 4], emoticons.count) // 할인율 조합
    var result = [0, 0] // 서비스 가입자, 판매액
    for discount in discounts {
        let prices = emoticons.enumerated().map{ discountPersent($0.element, discount[$0.offset]) } 
        let cost = costCalcurate(discount, prices)
        // 가입자가 더 많은지 or 가입자는 같고 구매액이 더 많은지 비교
        if result[0] < cost[0] || result[0] == cost[0] && result[1] < cost[1] {
            result = cost
        }
    }
    
    return result
}

// 할인율의 조합 구하기
func combination(_ discounts: [Int],_ count: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    func combi(_ index: Int,_ now: [Int]) {
        if now.count == count {
            result.append(now)
            return
        }
        for i in 0..<discounts.count {
            combi(i + 1, now + [discounts[i]])
        }
    }
    combi(0, [])
    return result
}

// 서비스 가입자와 구매액 계산하기
func costCalcurate(_ discounts: [Int],_ prices: [Int]) -> [Int] {
    var result = [0, 0]
    for u in user {
        let userPersent = u[0]
        let userPrice = u[1]
        
        let buysIndex = discounts.enumerated().filter{ ($0.element * 10) >= userPersent }.map{ $0.offset }
        
        var buyPrice = 0
        buysIndex.forEach{ index in 
                            buyPrice += prices[index]
                         }
        
        if buyPrice >= userPrice {
            result[0] += 1
        }else {
            result[1] += buyPrice
        }

    }
    
    return result
}

// 할인된 가격 계산하기
func discountPersent(_ price: Int,_ persent: Int) -> Int {
    return price - ((price / 100) * (persent * 10))
}