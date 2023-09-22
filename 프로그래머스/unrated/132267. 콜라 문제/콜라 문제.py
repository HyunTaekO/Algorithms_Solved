def solution(a, b, n):
    result = 0
    myBottle = n
    
    while myBottle >= a:
        plus = (myBottle // a) * b
        myBottle += plus - ((myBottle // a) * a)
        result += plus
        
    return result