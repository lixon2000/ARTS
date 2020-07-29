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
#### Class字节码
字节码的数据类型：无符号数属于基本的数据类型，以u1、u2、u4、u8来分别代表1个字节、2个字节、4个字节和8个字节的无符号数，无符号数可以用来描述数字、索引引用、数量值或者按照UTF-8编码构成字符串值。
表是由多个无符号数或者其他表作为数据项构成的复合数据类型，所有表都习惯性地以“_info”结尾。表用于描述有层次关系的复合结构的数据，整个Class文件本质上就是一张表。

 - 魔数——0xCAFEBABE；
 - 版本——Java文件的版本；
 - 常量池——存储其他区域所有的常量，Class文件之中的资源仓库；
 - 访问标志——这个Class是类还是接口、public、abstract，如果是类的话，是否被声明为final等；
 - 类索引、父类索引与接口索引集合——确定类的继承关系；
 - 字段表集合——每个字段的访问标志、简单名称、描述符；
 - 方法表集合——每个方法的访问标志、简单名称、描述符，重写和重载有特殊要求；
 - 属性表——描述某些场景专有的信息；其中Code区存储的字节码指令十分重要；


# Share
### 面对海量数据的计数器要如何做？
 - 在数据量和访问量都不大的时候，直接使用单MySQL；
 - 随着数据量增大，MySQL要分库分表，可以按照id的hash值取模分库，也可以按照时间；
 - 访问量不断增加，使用Redis加速访问，但由于一致性欠佳，直接抛弃MySQL，使用Redis；
 - 写入量继续增加，引入消息队列来缓冲。
 - Redis使用内存，存储成本很高，于是对Redis原生代码进行改造，同时使用SSD+内存的方式，减小内存开销。

