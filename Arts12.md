Arts12
===

# Algorithm
## 86. 分隔链表.  <https://leetcode-cn.com/problems/partition-list/>
### 描述：给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。你应当保留两个分区中每个节点的初始相对位置。
### 思路：和x比较大小，拆成两个链表，再合并。
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
	    public ListNode partition(ListNode head, int x) {

	    	if(head == null || head.next == null){
	    		return head;
	    	}
	    	
	    	ListNode ls = new ListNode(-1);
	    	ListNode lHead = ls;
	    	ListNode rs = new ListNode(-1);
	    	ListNode rHead = rs;
	    	
	    	while(head != null){
	    		if(head.val < x){
	    			ls.next = head;
	    			ls = head;
	    		} else{
	    			rs.next = head;
	    			rs = head;
	    		}
	    		
	    		head = head.next;
	    	}
	    	
            rs.next = null;
	    	ls.next = rHead.next;
	    	return lHead.next;
	    
    }
	}
# Review
SQL queries don't start with SELECT<https://jvns.ca/blog/2019/10/03/sql-queries-don-t-start-with-select/>  
SQL语句的执行顺序相关的问题，通常的顺序是：
 - FROM/JOIN and all the ON conditions
 - WHERE
 - GROUP BY
 - HAVING
 - SELECT (including window functions)
 - ORDER BY
 - LIMIT


# Tips
#### 快速排序和荷兰国旗算法
 - 快速排序的思想的核心是：使用一次遍历，将一个数组以一个数分成大小两部分。
 - 于是快速排序就是一个波兰国旗算法（两色）。它的实现是分成已处理和未处理两个区间，使用i、j两个指针，i指向已处理区间的头部，j在未处理区间里面遍历。一旦j遇到前色，就将它移到已处理区间，（将i和j的值交换）。这个算法是从左向右遍历，分成左右两部分。如果我们将算法改进一下，从左和右都遍历的话，就可以分成三部分。
 - 荷兰国旗算法：它的实现是分成两个已处理和一个未处理三个区间，使用i、j、k两个指针，i、j与上一步相同，k是个反方向的i。i指向前面已处理区间的头部，j在未处理区间里面遍历，k指向后面已处理的尾部，j遍历时遇到红色则移到前面已处理区间，遇到蓝色则移到后面已处理区间，即遇到红色交换j与i的值，遇到蓝色交换k与i的值。



# Share
### 计数系统设计：50万QPS下如何设计未读数系统？
 - 评论未读、@未读、赞未读等一对一关系的未读数可以使用上节课讲到的通用计数方案来解决；
 - 在系统通知未读、全量用户打点等存在有限的共享存储的场景下，可以通过记录用户上次操作的时间或者偏移量，来实现未读方案；
 - 最后，信息流未读方案最为复杂，采用的是记录用户博文数快照的方式。

