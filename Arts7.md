Arts7
===

# Algorithm
## 剑指 Offer 24. 反转链表 ，<https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/>
### 描述：定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。 
### 思路：双指针迭代，迭代过程中，使用临时节点将下一个节点先存下来。
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
        public ListNode reverseList(ListNode head) {
            ListNode pre = null;
            ListNode cur = head;

            while(cur != null){
              ListNode temp = cur.next;
              cur.next = pre;
              pre = cur;
              cur = temp;
            }

            return pre;
        }
    }

# Review
How I use Wireshark
<https://jvns.ca/blog/2018/06/19/what-i-use-wireshark-for/>  
 - 分析tcpdump获得的pcap文件；
 - 查看一个TCP连接上的所有消息；
 - 查看各个包体的具体字节，以及各层次的包头；
 - 查找指定信息；
 - 查看统计信息；

# Tips
#### CAS无锁技术
 - CAS是乐观锁，不会阻塞，会返回失败。Synchronize是悲观锁、独占锁。
 - CAS(V, E, N)，V是要修改的值地址，E是旧的预期值，N是新值。更新的时候比较V和E，相等就可以更新，不等则说明已经有其他线程进行了更新，返回失败。这个技术的核心是值的地址不会改变，多线程访问的是同个地址，而从该地址取值是原子操作。
 - CAS是系统原语，CPU指令级的操作，不能拆分，执行过程不能中断，因此多线程同时调用CAS不会引发冲突。
 - AtomicInteger使用CAS实现，其中保存了value的内存偏移量valueOffset，更新value的时候可以直接传递给unsafe。
 - CAS的三个问题：空转消耗CPU；ABA问题；只针对一个值。
 - ABA问题的解决：对更改的值加版本或时间戳。

# Share
### 配置管理：成千上万的配置项要如何管理？
开发应用管理配置的方式有两种：一种是通过配置文件来管理；另一种是使用配置中心来管理。
 - 配置中心关注的性能指标中，可用性的优先级是高于性能的；
 - 为了实现高可用，增加两级缓存：第一级缓存是内存的缓存；另外一级缓存是文件的缓存。
