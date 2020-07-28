Arts11
===

# Algorithm
## 剑指 Offer 45. 把数组排成最小的数 ，<https://leetcode-cn.com/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof/>
### 描述：输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
### 思路：int转成字符串，比较两个字符串a+b和b+a的大小，然后整体排序。
### java实现：
	class Solution {

	    public String minNumber(int[] nums) {

	    	String[] numStrs = new String[nums.length];
	    	for(int i=0; i<nums.length; i++){
	    		numStrs[i] = String.valueOf(nums[i]);
	    	}
	    	
	    	sort(numStrs);
	    	
	    	StringBuilder sb = new StringBuilder(); 
	    	for(String s: numStrs){
	    		sb.append(s);
	    	}
	    	return sb.toString();
	    }
	    
	    private void sort(String[] numStrs){
	    	// 插入排序 
	    	int arrayLen = numStrs.length;
	    	if(arrayLen <= 1){
	    		return;
	    	}
	    	
	    	for(int i=1; i<arrayLen; i++){
	    		
	    		// [0,i-1]是排好序的区间
	    		String value = numStrs[i];
	    		int j=i-1;
	    		for(; j>=0; j--){
	    			if(compare(value, numStrs[j]) < 0){
	    				numStrs[j+1] = numStrs[j];
	    			} else{
	    				break;
	    			}
	    		}
	    		numStrs[j+1] = value;
	    	}
	    	
	    }
	    
	    // 1:a>b; -1:a<b
	    private int compare(String a, String b){
            return (a+b).compareTo(b+a);
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

