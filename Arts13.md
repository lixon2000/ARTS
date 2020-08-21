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
c				if(head1.val <= head2.val){
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
该文用生动的漫画解释了curl、ssh、netcat、nmap、openSSL、ethtool网络工具。



# Tips
#### 类加载的过程
 - 加载：1）通过一个类的全限定名来获取定义此类的二进制字节流。（虚拟机以外的类加载器来做）2）将这个字节流所代表的静态存储结构转化为方法区的运行时数据结构。3）在内存中生成一个代表这个类的java.lang.Class对象，作为方法区这个类的各种数据的访问入口。
 - 验证：（文件格式验证、元数据验证、字节码验证、符号引用验证）确保字节流中包含的信息符合当前虚拟机的要求。
 - 准备：准备阶段是正式为类变量分配内存并设置类变量初始值的阶段，这些变量所使用的内存都将在方法区中进行分配。
 - 解析：解析阶段是虚拟机将常量池内的符号引用替换为直接引用的过程。
 - 初始化：到了初始化阶段，才真正开始执行类中定义的Java程序代码（字节码）。初始化阶段是执行类构造器＜clinit＞（）方法的过程。

# Share
### 信息流设计（一）：通用信息流系统的推模式要如何做？
 - 信息流的架构演化
 - 1、一开始很简单，两张表，一张存储关注关系 ，一张存储微博消息，用户A发微博就是在相应的微博消息表中写入一条即可，用户B读微博也很简单，就是先得到自己关注的用户列表，然后定时去存储微博消息表中去读取自己关注的微博展示出来即可，优点是只有一份存储，缺点也很明显，对于这张表的读操作太多了，并发过大。
 - 2、改成推模式，即写扩散机制，用户A发送一条消息，除了写入微博消息表以外，还要写入关注它的所有的用户的收件箱中（这个可以用redis来实现），然后用户去收件箱中读取消息即可，优点就是自己读自己的消息，跟别人没有竞争，缺点是多余存储，在大V用户发微博消息中有延迟，同时写入次数太多了，同时取消关注什么的也比较难操作。
 - 3、后面改成了推拉结合的方式，即对于大V用拉模式，对于普通的用户继续用推模式。
 - 4、后面出现了基于时间分区的拉模式，个人觉得可以结合推模式来进行相应的弥补。

