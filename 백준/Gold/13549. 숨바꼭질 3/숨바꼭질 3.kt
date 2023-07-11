import java.util.*
fun main(args: Array<String>) {
    val INF=987654321
    val MAX= 100001
    val (N,K)=readLine()!!.split(" ").map{it.toInt()}

    var visit:IntArray=IntArray(MAX,{0})
    var dist:IntArray=IntArray(MAX,{INF})
    var q: Queue<Int> = LinkedList<Int>()
    
    
    q.add(N)
    dist[N]=0
    
    while(q.peek()!=null)
    {
    	val now:Int=q.poll()
      if(now==K) break
      if(visit[now]==1) continue
      visit[now]=1

      var next:Int=2*now
      if(next<=MAX-1&&dist[next]>dist[now])
      {
        q.add(next)
        dist[next]=dist[now]
      }
      next=now+1
      if(next<=MAX-1&&dist[next]>dist[now]+1)
      {
        q.add(next)
        dist[next]=dist[now]+1
      }
      next=now-1
      if(0<=next&&dist[next]>dist[now]+1)
      {
        q.add(next)
        dist[next]=dist[now]+1
      }
    
    }
  	print(dist[K])
}