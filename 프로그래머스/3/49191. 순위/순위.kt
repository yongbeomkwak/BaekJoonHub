class Solution {
    fun solution(n: Int, results: Array<IntArray>): Int {
        var answer = 0
        val adj:Array<Array<Int>> =Array(n+1,{Array<Int>(n+1,{0})})
        
        for((u,v) in results)
        {
            adj[u][v]=1
        }
        
        for(k in 1..n)
        {
            for(u in 1..n)
            {
                for(v in 1..n)
                {
                    if(adj[u][k]==1&&adj[k][v]==1)
                    {
                        adj[u][v]=1
                    }
                }
            }
        }
        
        for(i in 1..n)
        {
            var cnt:Int =0
            for(j in 1..n)
            {
                if(adj[i][j]==1||adj[j][i]==1) cnt++
            }
            if(cnt==n-1) answer++
        }
        
        
        return answer
    }
}