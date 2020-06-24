Arts5
===

# Algorithm
## LeetCode 21. 合并两个有序链表 ，<https://leetcode-cn.com/problems/merge-two-sorted-lists/>
### 描述：将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
### 思路：同时遍历两个链表，生成一个新的链表。
### java实现：
    class Solution {
        public ListNode mergeTwoLists(ListNode l1, ListNode l2) {

                ListNode preHead = new ListNode(-1);
                ListNode prev = preHead;
                while(l1 != null && l2 != null){
                    if(l1.val <= l2.val){
                        prev.next = l1;
                        l1 = l1.next;
                    } else {
                        prev.next = l2;
                        l2 = l2.next;
                    }
                    prev = prev.next;
                }

                prev.next = (l1 == null) ? l2: l1;

                return preHead.next;

        }
    }

# Review
How to put an HTML page on the internet 
<https://jvns.ca/blog/2019/09/06/how-to-put-an-html-page-on-the-internet/>  
该文列出了一个简单的建站流程，并没太大技术含量，仅仅读懂英文而已。

# Tips
#### TCP的三次握手和四次挥手
 - 三次握手的原因：1 半连接状态需要双方确认自身准备就绪，而二次握手后，服务端不知道客户端的接收能力是否正常，或者说二者握的是序列号，通过二次握手尚未对ISN协商完毕；2 考虑SYN在网络中滞留丢失后再次来到服务端的情况，不能让服务端收到SYN就认为连接就绪。
 - ISN是根据时间动态生成的，原因：1 防止收到滞留分组后影响正常数据，2 防止被攻击者猜出。
 - 前两次SYN不能带数据，第三次ACK可以带数据，因为此时客户端认为半连接已经是Establish了。前两次不带数据是避免攻击。
 - SYN攻击向服务端发送SYN，服务端收到来自不同IP的SYN后，这些连接成为SYN_RECV状态，进入队列，回SYN_ACK等待超时，从而影响正常连接。
 - 四次挥手不能三次：半连接状态，前两次回收只能表明一方发送完毕了，另一方还可以发送。因此不能将中间两次回收合并。
 - 2MSL：1 万一最后一个ACK丢包，最长需要等待一去一来两个MSL时间才能收到FIN的重传；2 让前一次连接滞留的分组失效。


# Share
### 应用性能管理：用户的使用体验应该如何监控？
 - 从客户端采集到的数据可以用通用的消息格式，上传到 APM 服务端，服务端将数据存入到 Elasticsearch 中，以提供原始日志的查询，也可以依据这些数据形成客户端的监控报表；
 - 用户网络数据是我们排查客户端，和服务端交互过程的重要数据，你可以通过代码的植入，来获取到这些数据；
 - 无论是网络数据，还是异常数据，亦或是卡顿、崩溃、流量、耗电量等数据，你都可以通过把它们封装成 APM 消息格式，上传到 APM 服务端，这些用户在客户端上留下的踪迹可以帮助你更好地优化用户的使用体验。
