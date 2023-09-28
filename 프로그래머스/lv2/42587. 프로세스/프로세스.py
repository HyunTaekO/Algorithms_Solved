def solution(priorities, location):
    answer = 0
    loc = location
    while priorities:
        elem = priorities.pop(0)
        loc -= 1
        if not priorities: return answer + 1
        if elem < max(priorities):
            priorities.append(elem)
            if loc < 0:
                loc = len(priorities) - 1
        else:
            answer += 1
            if loc < 0: return answer
            
    return answer