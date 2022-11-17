from collections import * 
def solution(genres, plays):
    answer = []
    
    # 1. 장르 높은
    # 2. 조회수 높은
    # 3. 고유번호가 낮은 노래
    
    hm = {}
    hm2 = {}
    
    
    for idx,song in enumerate(zip(genres,plays)):
        genre = song[0]
        play = song[1]
        if genre in hm:
            hm[genre] += play
            hm2[genre].append((idx,play))
        else:
            hm[genre] = play
            hm2[genre] = [(idx,play)]
    
    chm = Counter(hm)
    
    order = []
    for k,v in chm.items():
        order.append((k,v))
    
    order = sorted(order,key = lambda h:-h[1])
    
    for k,_ in order:
        li = sorted(hm2[k],key=lambda h:-h[1])[:2]
        
        for i,_ in li:
            answer.append(i)
        
    
    
    
    
    
    
    
    
    return answer