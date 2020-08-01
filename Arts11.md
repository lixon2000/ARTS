Arts11
===

# Algorithm
## 56. 合并区间. 把数组排成最小的数 ，<https://leetcode-cn.com/problems/merge-intervals/>
### 描述：给出一个区间的集合，请合并所有重叠的区间。
### 思路：先按区间前边界排序，得到的数组中，如果有重叠区间，一定是连续的；再遍历一次，通过判断后边界，依次合并。
### java实现：
	class Solution {
   	 public int[][] merge(int[][] intervals) {
		    	if(intervals.length <= 0){
		    		return new int[][]{};
		    	}
		    	// 排序
		    	Arrays.sort(intervals, new Comparator<int[]>(){
					@Override
					public int compare(int[] o1, int[] o2) {
						return o1[0] - o2[0];
					}
		    	});
		    	
		    	List<int[]> res = new ArrayList<>();
		    	res.add(intervals[0]);
		    	for(int i=1; i<intervals.length; i++){
		    		int[] peek = res.get(res.size() - 1);
		    		int[] curInterval = intervals[i];
		    		
		    		if(curInterval[0] <= peek[1]){
		    			// 合并
		    			peek[1] = Math.max(curInterval[1], peek[1]);
		    		} else{
		    			res.add(curInterval);
		    		}
		    	}
		    	
		    	return res.toArray(new int[res.size()][2]);
		    	
	//		    	Arrays.sort(intervals, Comparator.comparingInt(o -> o[0]));
		    
   	 }
	}
# Review
What's interesting about UDP?<https://jvns.ca/blog/2016/12/21/what-s-interesting-about-udp/>  
作者列举了UDP中有趣的一些方面：
 - DNS uses UDP；
 - statsd uses UDP；
 - Packet size limits；
 - WebRTC uses UDP；
 - Some games use UDP；
 - video streaming uses UDP, sometimes；
 - probably don’t reimplement TCP on top of UDP；
 - Google is maybe trying to reimplement TCP with UDP though；
 - multicast；


# Tips
#### 一个外排序问题
现在你有 10 个接口访问日志文件，每个日志文件大小约 300MB，每个文件里的日志都是按照时间戳从小到大排序的。你希望将这 10 个较小的日志文件，合并为 1 个日志文件，合并之后的日志仍然按照时间戳从小到大排列。如果处理上述排序任务的机器内存只有 1GB，你有什么好的解决思路，能“快速”地将这 10 个日志文件合并吗？

 - 这种外部排序的三个要点：
 - 1 尽量减少io读写，在内存中操作数据。意味着不能在文件上排序和查找，不能逐条读写。因此一定要每次读写一块数据。
 - 2 尽量减少数据在内存的复制次数。意味着内存也尽量不要逐条读写。
 - 3 每个文件中的数据已经有序，因此需要找到合理的排序方法，例如归并。快速排序在这种情况下并没有优势。


# Share
### 计数系统设计：50万QPS下如何设计未读数系统？
 - 评论未读、@未读、赞未读等一对一关系的未读数可以使用上节课讲到的通用计数方案来解决；
 - 在系统通知未读、全量用户打点等存在有限的共享存储的场景下，可以通过记录用户上次操作的时间或者偏移量，来实现未读方案；
 - 最后，信息流未读方案最为复杂，采用的是记录用户博文数快照的方式。

