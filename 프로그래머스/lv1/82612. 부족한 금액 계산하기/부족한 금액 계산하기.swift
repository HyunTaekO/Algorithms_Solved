import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var pp : Int = price;
    var RM : Int = 0;
    for i in 0...count{
        if i > 1{
            pp = pp + price*i
            RM = money - i
            print(pp)
        }
    }
    if money > pp{
        answer = 0
    }else{
        answer = Int64(pp - money)
    }
    return answer
}