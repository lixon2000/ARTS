Arts10
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
CDNs aren't just for caching<https://jvns.ca/blog/2016/04/29/cdns-arent-just-for-caching//>  
该文指出，CDN不仅用于缓存：
 - make your site faster: speed up the dreaded TLS handshake，TLS握手加速；
 - make your site faster: smart routing，智能路由；
 - keep your site up: DDOS mitigation，缓解DDos攻击；
 - performance is reliability，稳定性能；


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
### 流量控制：高并发系统中我们如何操纵流量？
 - 核心业务需要限流保护策略。
 - 基于时间窗口维度的算法有固定窗口算法和滑动窗口算法，两者虽然能一定程度上实现限流的目的，但是都无法让流量变得更平滑。
 - 令牌桶算法和漏桶算法则能够塑形流量，让流量更加平滑，但是令牌桶算法能够应对一定的突发流量，所以在实际项目中应用更多。

