from sys import stdin
if __name__ =='__main__':
    
    n,m = (stdin.readline()).split(" ")
    n=int(n)
    m=int(m)
    _min=min(n,m)
    str_list=[""]*n
    
    for i in range(n):
        _in=stdin.readline()[:-1]
        str_list[i]=_in
    
    ans:int =1
    
    
    for i in range(n):
        for j in range(m):
            for l in range(1,_min):
                right:int=j+l
                bottom:int=i+l
                if(right>=m or bottom >=n): # 범위 벗어나면 다시 
                    break
                
                top_left=str_list[i][j]
                top_right=str_list[i][right]
                bottom_left=str_list[bottom][j]
                bottom_right=str_list[bottom][right]
                
                if(top_left==top_right and top_left==bottom_left and top_left==bottom_right): #모두 같은 값이면 
                    ans=max(ans,(l+1)**2) # 해당 (길이+1) 제곱, l=1일 때 해당 사각형 길이가 2 
    
    print(ans)
        
    
   
