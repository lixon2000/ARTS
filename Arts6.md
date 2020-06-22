Arts5
===

# Algorithm
## LeetCode 14. 最长公共前缀 ，<https://leetcode-cn.com/problems/longest-common-prefix/>
### 描述：编写一个函数来查找字符串数组中的最长公共前缀。如果不存在公共前缀，返回空字符串 ""。
### 思路：从第一个字符开始，遍历每个字符串，直到发现不同的字符。
### java实现：
    class Solution {
        public String longestCommonPrefix(String[] strs) {
                if(strs == null || strs.length == 0){
                    return "";
                }

                String subStr = "";
                int length = strs[0].length();

                for(int j=0; j<length; j++){	// 每个char
                    char publicChar = 0;
                    for(int i=0; i<strs.length; i++){	// 每个字符串

                        String str = strs[i];
                        if(str.length() <= j){
                            // 终止
                            return subStr;
                        } else{
                            char c = str.charAt(j);
                            if(publicChar != 0 && publicChar != c){
                                return subStr;
                            } else{
                                publicChar = c;
                            }
                        }

                    }
                    subStr += publicChar;
                }

                return subStr;

        }
    }

# Review
How to put an HTML page on the internet 
<https://jvns.ca/blog/2019/09/06/how-to-put-an-html-page-on-the-internet/>  
该文列出了一个简单的建站流程，并没太大技术含量，仅仅读懂英文而已。

# Tips
#### select和Epoll
 - Select。BIO阻塞一个线程监听socket的IO事件，导致select的诞生。而select解决了阻塞的问题，但方式比较粗暴。一个问题是，主线程在select时，向所有socket注册了自己，并将自己阻塞，等待事件。当OS中断引起IO事件触发时，线程唤醒，要从所有socket中移除。另一个问题，主线程唤醒，要遍历所有IO事件才能知道是哪个socket发出了事件。
 - Epoll的诞生，是将select精细化。Eventpoll对象像是线程和socket之间的一个代理，将socket维护到自己的红黑树里，此后阻塞等待，线程唤醒时不需要遍历socket移除。Epoll中维护事件的列表rdlist，socket产生事件后插入其中，线程唤醒后，可以迅速找到就绪的事件而避免遍历所有socket。


# Share
### 应用性能管理：用户的使用体验应该如何监控？
 - 从客户端采集到的数据可以用通用的消息格式，上传到 APM 服务端，服务端将数据存入到 Elasticsearch 中，以提供原始日志的查询，也可以依据这些数据形成客户端的监控报表；
 - 用户网络数据是我们排查客户端，和服务端交互过程的重要数据，你可以通过代码的植入，来获取到这些数据；
 - 无论是网络数据，还是异常数据，亦或是卡顿、崩溃、流量、耗电量等数据，你都可以通过把它们封装成 APM 消息格式，上传到 APM 服务端，这些用户在客户端上留下的踪迹可以帮助你更好地优化用户的使用体验。
