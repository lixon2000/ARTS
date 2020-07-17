Arts9
===

# Algorithm
## 面试题 02.08. 环路检测 ，<https://leetcode-cn.com/problems/linked-list-cycle-lcci/>
### 描述：给定一个有环链表，实现一个算法返回环路的开头节点。有环链表的定义：在链表中某个节点的next元素指向在它前面出现过的节点，则表明该链表存在环路。。
### 思路：快慢两个指针迭代，相遇时表示有环。此时一个指针从当前节点迭代，另一个指针从head迭代，相遇点即是环的入口。
### java实现：
	/**
	 * Definition for singly-linked list.
	 * class ListNode {
	 *     int val;
	 *     ListNode next;
	 *     ListNode(int x) {
	 *         val = x;
	 *         next = null;
	 *     }
	 * }
	 */
	public class Solution {
	    public ListNode detectCycle(ListNode head) {
		        
		    	if(head == null || head.next == null){
		    		return null;
		    	}
		    	
		    	// 两个指针
		    	ListNode slow = head;
		    	ListNode fast = head;
		    	while(fast != null){
		    		
		    		// slow走一步
	    		slow = slow.next;
		    		
		    		// fast走两步
		    		fast = fast.next;
		    		if(fast != null){
		    			fast = fast.next;
		    		}
		    		
		    		if(slow == fast){
		    			break;
		    		}
		    	}
		    	
		    	if(fast == null){
		    		return null;
		    	}
		    	
		    	// 此时slow是相遇点
		    	
		    	// 找入口
		    	fast = head;
		    	while(fast != slow){
		    		fast = fast.next;
		    		slow = slow.next;
		    	}
		    	
		    	return slow;

   		 }
	}

# Review
Iptables basics<https://jvns.ca/blog/2017/06/07/iptables-basics/>  
iptable的基本知识
 - filter主要用于过滤消息；
 - nat用于转发内网和外网间的消息；
 - SNAT，基于源地址的地址转换；
 - DNAT，基于目标的网络地址转；
 - MASQUERADE，地址伪装；


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
 - 核心业务需要限流。
 - 固定窗口与滑动窗口算法。
 - 漏桶和令牌桶。

