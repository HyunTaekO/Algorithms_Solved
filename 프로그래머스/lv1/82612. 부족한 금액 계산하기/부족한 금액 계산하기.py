def solution(price, money, count):
    answer = price
    for i in range(2, count + 1):
        answer += price * i
        
    return 0 if answer - money < 0 else answer - money