def solution(bridge_length, weight, truck_weights):
    answer = 0
    ing = [0] * bridge_length
    w = 0
    
    while ing:
        answer += 1
        w -= ing.pop(0)
        
        if truck_weights:
            if w + truck_weights[0] <= weight:
                newTruck = truck_weights.pop(0)
                ing.append(newTruck)
                w += newTruck
            else:
                ing.append(0)
            
        
    return answer