Arts13
===

# Algorithm
## 148. 排序链表.  <https://leetcode-cn.com/problems/sort-list/>
### 描述：在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
### 思路：递归使用归并排序。
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

		public ListNode sortList(ListNode head) {
			return mergeSort(head);
		}
		
		private ListNode mergeSort(ListNode head){
			
			if(head == null || head.next == null){
				return head;
			}
			
			// 找中点
			ListNode fastP = head.next;
			ListNode slowP = head;
			while(fastP != null && fastP.next != null){
				fastP = fastP.next.next;
				slowP = slowP.next;
			}
			
			// 断开
			ListNode head2 = slowP.next;
			slowP.next = null;
			
			// 小区间排序
			head = mergeSort(head);
			head2 = mergeSort(head2);
			
			// 合并
			return merge(head, head2);
		}
		
		private ListNode merge(ListNode head1, ListNode head2){
			ListNode dummyNode = new ListNode(-1);
			ListNode cur = dummyNode;
			
			while(head1 != null && head2 != null){
				if(head1.val <= head2.val){
					cur.next = head1;
					head1 = head1.next;
				} else{
					cur.next = head2;
					head2 = head2.next;
				}
				cur = cur.next;
			}
			
			if(head1 == null){
				cur.next = head2;
			}
			
			if(head2 == null){
				cur.next = head1;
			}
			
			return dummyNode.next;
		}
	}
	
# Review
Networking tool comics!<https://jvns.ca/blog/2019/02/10/a-few-networking-tool-comics/>  
网络工具的有趣解释：
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
### 信息流设计（一）：通用信息流系统的推模式要如何做？
 - 信息流的架构演化
 - 1、一开始很简单，两张表，一张存储关注关系 ，一张存储微博消息，用户A发微博就是在相应的微博消息表中写入一条即可，用户B读微博也很简单，就是先得到自己关注的用户列表，然后定时去存储微博消息表中去读取自己关注的微博展示出来即可，优点是只有一份存储，缺点也很明显，对于这张表的读操作太多了，并发过大。
 - 2、改成推模式，即写扩散机制，用户A发送一条消息，除了写入微博消息表以外，还要写入关注它的所有的用户的收件箱中（这个可以用redis来实现），然后用户去收件箱中读取消息即可，优点就是自己读自己的消息，跟别人没有竞争，缺点是多余存储，在大V用户发微博消息中有延迟，同时写入次数太多了，同时取消关注什么的也比较难操作。
 - 3、后面改成了推拉结合的方式，即对于大V用拉模式，对于普通的用户继续用推模式。
 - 4、后面出现了基于时间分区的拉模式，个人觉得可以结合推模式来进行相应的弥补。

