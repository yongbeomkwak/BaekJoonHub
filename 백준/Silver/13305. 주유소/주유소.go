package main

import (
	"fmt"
)

func max(a int, b int) int {
	if a > b {
		return a
	}
	return b
}

func main() {
	const LMIT = 100001
	const MAX = 1000000000
	var dis [LMIT]int
	var grd [LMIT]int
	mincost := MAX
	N := 0
	result := 0
	mindex := 0
	L := 0
	fmt.Scan(&N)
	for i := 1; i < N; i++ {
		fmt.Scan(&dis[i])
		L += dis[i]
	}
	for i := 1; i < N; i++ {
		fmt.Scan(&grd[i])
		if grd[i] < mincost {
			mincost = grd[i]
			mindex = i
		}
	}
	if mindex == 1 {
		result = grd[1] * L
	} else {
		mincost = grd[1]
		result += mincost * dis[1]
		L -= dis[1]
		for i := 2; i < mindex; i++ {
			if mincost < grd[i] {
				result += mincost * dis[i]
				L -= dis[i]
			} else {
				mincost = grd[i]
				result += mincost * dis[i]
				L -= dis[i]
			}
		}
		result += grd[mindex] * L
	}
	fmt.Print(result)

}
