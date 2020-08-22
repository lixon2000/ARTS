Arts14
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
### 信息流设计（二）：通用信息流系统的拉模式要如何做？
 - 基于拉模式和推拉结合模式实现信息流系统的方案
 - 在拉模式下，我们只需要保存用户的发件箱，用户的信息流是通过聚合关注者发件箱数据来实现的；
 - 拉模式会有比较大的聚合成本，缓存节点也会存在带宽的瓶颈，所以我们可以通过一些权衡策略尽量减少获取数据的大小，以及部署缓存副本的方式来抗并发；
 - 推拉结合的模式核心是只推送活跃的粉丝用户，需要维护用户的在线状态以及活跃粉丝的列表，所以需要增加多余的空间成本来存储，这个需要来权衡。

