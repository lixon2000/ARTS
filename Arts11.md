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
### 面对海量数据的计数器要如何做？
 - 在数据量和访问量都不大的时候，直接使用单MySQL；
 - 随着数据量增大，MySQL要分库分表，可以按照id的hash值取模分库，也可以按照时间；
 - 访问量不断增加，使用Redis加速访问，但由于一致性欠佳，直接抛弃MySQL，使用Redis；
 - 写入量继续增加，引入消息队列来缓冲。
 - Redis使用内存，存储成本很高，于是对Redis原生代码进行改造，同时使用SSD+内存的方式，减小内存开销。

