def solution(s):
    answer = True
    open = 0
    for str in s:
        if str == '(': 
            open += 1
        else:
            open -= 1
        if open < 0: return False
    if open == 0: return True
    return False