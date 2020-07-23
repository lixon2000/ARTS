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
#### JVM内存分配
- 对象优先在Eden分配。大多数情况下，对象在新生代Eden区中分配。当Eden区没有足够空间进行分配时，虚拟机将发起一次Minor GC。
- 大对象直接进入老年代。
- 长期存活的对象将进入老年代。虚拟机给每个对象定义了一个对象年龄（Age）计数器。对象在Survivor区中每“熬过”一次Minor GC，年龄就增加1岁，当它的年龄增加到一定程度（默认为15岁），就将会被晋升到老年代中。
同年对象，如果在Survivor空间中相同年龄所有对象大小的总和大于Survivor空间的一半，年龄大于或等于该年龄的对象就可以直接进入老年代，无须等到MaxTenuringThreshold中要求的年龄。
#### JVM垃圾收集流程
 - Minor GC是指从年轻代空间（包括 Eden 和 Survivor 区域）回收内存。
 - Major GC清理Tenured区(老年代)。
 - Full GC清理整个heap区，包括Yong区和Tenured区。
 - 在发生Minor GC之前，虚拟机会先检查老年代最大可用的连续空间是否大于新生代所有对象总空间。如果这个条件成立，那么Minor GC可以确保是安全的。否则Full GC。
JDK 6 Update24之后的规则变为只要老年代的连续空间大于新生代对象总大小或者历次晋升的平均大小就会进行Minor GC，否则将进行Full GC。
 - Minor GC简要的流程：
 - 1.	在GC开始的时候，对象只会存在于Eden区和名为“From”的Survivor区，Survivor区"To"是空的。
 - 2.	紧接着进行GC，Eden区中所有存货的对象都会被复制到“To”,而在“From”区中，仍存活的对象会根据他们的年龄值来决定去向。年龄到达一定值（年龄阀值，可以通过-XX:MaxTenuringThreshold来设置）的对象会被移动到年老代中，没有达到阀值的对象会被复制到“To”区域。
 - 3.	经过这次GC后，Eden区和From区已经被清空。这个时候，“From”和“To”会交换他们的角色，也就说新的“To”就是上次GC前的“From”,新的“From”就是上次GC前的To”。不管怎样，都会保证名为To的Survivor区域是空的。
 - 4.	GC会一直重复这样的过程，直到“To”区被填满之后，会将所有对象移动到年老代中。


# Share
### 流量控制：高并发系统中我们如何操纵流量？
 - 核心业务需要限流保护策略。
 - 基于时间窗口维度的算法有固定窗口算法和滑动窗口算法，两者虽然能一定程度上实现限流的目的，但是都无法让流量变得更平滑。
 - 令牌桶算法和漏桶算法则能够塑形流量，让流量更加平滑，但是令牌桶算法能够应对一定的突发流量，所以在实际项目中应用更多。

