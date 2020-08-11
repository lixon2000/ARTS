Arts12
===

# Algorithm
## 86. 分隔链表.  <https://leetcode-cn.com/problems/partition-list//>
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

