Arts4
===

# Algorithm
## LeetCode 13 罗马数字转整数 ，<https://leetcode-cn.com/problems/roman-to-integer//>
### 描述：给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。。
### 思路：从左向右两个字符一起遍历，判断前面字符是否小于后面字符。
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
Network-Layer DDoS Attack Trends for Q1 2020?  
<https://blog.cloudflare.com/network-layer-ddos-attack-trends-for-q1-2020//>  
该文总结了一些2020年一季度DDOS攻击的趋势。


# Tips
#### select和Epoll
 - Select。BIO阻塞一个线程监听socket的IO事件，导致select的诞生。而select解决了阻塞的问题，但方式比较粗暴。一个问题是，主线程在select时，向所有socket注册了自己，并将自己阻塞，等待事件。当OS中断引起IO事件触发时，线程唤醒，要从所有socket中移除。另一个问题，主线程唤醒，要遍历所有IO事件才能知道是哪个socket发出了事件。
 - Epoll的诞生，是将select精细化。Eventpoll对象像是线程和socket之间的一个代理，将socket维护到自己的红黑树里，此后阻塞等待，线程唤醒时不需要遍历socket移除。Epoll中维护事件的列表rdlist，socket产生事件后插入其中，线程唤醒后，可以迅速找到就绪的事件而避免遍历所有socket。


# Share
### 给系统加上眼睛：服务端监控要怎么做？
 - 监控指标的选择：耗时、请求量和错误数；
 - 数据采集方式：Agent、埋点和日志；
 - 监控数据的处理和存储：访问趋势表、性能报表、资源报表；
