Arts9
===

# Algorithm
## 剑指 Offer 22. 链表中倒数第k个节点 ，<https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/>
### 描述：输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。
### 思路：前后双指针迭代，两个指针间隔k。
### java实现：
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     int val;
     *     ListNode next;
     *     ListNode(int x) { val = x; }
     * }
     */
    class Solution {
        public ListNode getKthFromEnd(ListNode head, int k) {

	    	ListNode front = head;	// 慢指针
	    	ListNode end = head;	// 快指针
	    	
	    	// end 先走k-1步
	    	for(int i=0; i<k-1; i++){
	    		if(end == null){
	    			return null;
	    		}
	    		end = end.next;
	    	}
	    	
	    	while(end.next != null){
	    		front = front.next;
	    		end = end.next;
	    	}
	    	
	    	return front;
	    
    }
}

# Review
Async IO on Linux: select, poll, and epoll
<https://jvns.ca/blog/2017/06/03/async-io-on-linux--select--poll--and-epoll/>  
此篇是一个人的读书心得，大致讲述了select、poll和epoll的一些观点
 - 不使用poll或select的原因：On each call to select() or poll(), the kernel must check all of the specified file descriptors to see if they are ready. 
 - epoll使用三个重要的系统调用：epoll_create, epoll_ctl, epoll_wait；
 - 为什么用epll：you’re likely using epoll to do all your networking & pipe I/O!


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
### 降级熔断：如何屏蔽非核心系统故障的影响？
 - 在分布式环境下最怕的是服务或者组件慢，因为这样会导致调用者持有的资源无法释放，最终拖垮整体服务。
 - 服务熔断的实现是一个有限状态机，关键是三种状态之间的转换过程。
 - 开关降级的实现策略主要有返回降级数据、降频和异步三种方案。

