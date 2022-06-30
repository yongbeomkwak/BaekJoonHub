from sys import *
from collections import * 

if __name__ =="__main__":
    n,m = stdin.readline()[:-1].split()
    n=int(n)
    m=int(m)
    
    s=dict()
    for _ in range(n):
        sinput=stdin.readline()[:-1]
        s[sinput]=1
    
    cnt:int =0
    for _ in range(m):
        msinput=stdin.readline()[:-1]
        if(s.get(msinput)!=None):
            cnt+=1
    
    
    stdout.write(f'{cnt}')