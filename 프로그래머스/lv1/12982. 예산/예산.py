def solution(d, budget):
    answer = 0
    d.sort()
    for m in d:
        if budget - m >= 0:
            answer += 1
            budget -= m
        else:
            break
    return answer