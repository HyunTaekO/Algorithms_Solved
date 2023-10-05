def solution(sizes):
    maxW = 0
    minH = 0
    for size in sizes:
        maxW = max(maxW, max(size))
        minH = max(minH, min(size))
        
    return maxW * minH