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
### 怎样设计全链路压力测试平台？
如何搭建全链路压测平台搭建全链路压测平台，主要有两个关键点。
 - 一点是流量的隔离。由于压力测试是在正式环境进行，所以需要区分压力测试流量和正式流量，这样可以针对压力测试的流量做单独的处理。
 - 另一点是风险的控制。也就是尽量避免压力测试对于正常访问用户的影响。
 - 一般来说全链路压测平台需要包含以下几个模块：流量构造和产生模块；压测数据隔离模块；系统健康度检查和压测流量干预模块。
