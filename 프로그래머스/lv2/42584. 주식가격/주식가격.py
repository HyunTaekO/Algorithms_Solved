from collections import deque

def solution(prices):
    answer = []
    queue = deque(prices)

    while queue:
        elem = queue.popleft()
        sec = 0
        for q in queue:
            sec += 1
            if q < elem:
                break
        answer.append(sec)

    
    return answer