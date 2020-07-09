Arts8
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
#### ThreadLocal
 - ThreadLocal字面意思是Thread的变量，它只能存储一个泛型的Value。但每个Thread中可以存储多个ThreadLocal的值，使用ThreadLocalMap数据结构，通过get、set读写，key是ThreadLocal。
 - 数据结构Thread (map<ThreadLocal, T>)
 - ThreadLocal表面上看上去是共享的对象，其实在set、get是都是取当前Thread，再从中拿到成员ThreadLocalMap，去set和get。
 - 同时，ThreadLocal本身并没有保存任何值，它只是个中介key，通过它读写的是Thread中存的值，所以说，ThreadLocal的前提是Thread。
 - ThreadLocal在每个线程中对连接会创建一个副本，且在线程内部任何地方都可以使用，线程之间互不影响，这样一来就不存在线程安全问题，也不会严重影响程序执行性能。
 - ThreadLocalMap中解决Hash冲突的方式并非链表的方式，而是采用线性探测的方式，所谓线性探测，就是根据初始key的hashcode值确定元素在table数组中的位置，如果发现这个位置上已经有其他key值的元素被占用，则利用固定的算法寻找一定步长的下个位置，依次判断，直至找到能够存放的位置。

# Share
### 配置管理：成千上万的配置项要如何管理？
开发应用管理配置的方式有两种：一种是通过配置文件来管理；另一种是使用配置中心来管理。
 - 配置中心关注的性能指标中，可用性的优先级是高于性能的；
 - 为了实现高可用，增加两级缓存：第一级缓存是内存的缓存；另外一级缓存是文件的缓存。
