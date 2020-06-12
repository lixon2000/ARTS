Arts4
===

# Algorithm
## LeetCode 13 罗马数字转整数 ，<https://leetcode-cn.com/problems/roman-to-integer//>
### 描述：给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。。
### 思路：从左向右两个字符一起遍历，判断前面字符是否小于后面字符。
### java实现：
    class Solution {
        public int romanToInt(String s) {
            int sum = 0;
            int pre = getValue(s.charAt(0));
            for(int i=1; i<s.length(); i++){
                int value = getValue(s.charAt(i));
                if(pre < value){
                    value -= pre;
                } else{
                    sum = sum + pre;
                }
                pre = value;
            }
            sum += pre;
            return sum;
        }
    
        private int getValue(char c){
            switch(c){
            case 'I':
                return 1;
            case 'V':
                return 5;
            case 'X':
                return 10;
            case 'L':
                return 50;
            case 'C':
                return 100;
            case 'D':
                return 500;
            case 'M':
                return 1000;
            default:
                return 0;
            }
        }
    }

# Review
Network-Layer DDoS Attack Trends for Q1 2020?  
<https://blog.cloudflare.com/network-layer-ddos-attack-trends-for-q1-2020//>  
该文总结了一些2020年一季度DDOS攻击的趋势。


# Tips
#### BIO、NIO和NIO2
BIO、NIO、Reactor
 - BIO，同步阻塞，每个线程处理一个socket阻塞读写。一个ServerSocket阻塞监听，accept到Socket后，分配一个线程（或线程池）负责读写。
 - NIO，同步非阻塞，一个select线程可以监听所有事件，以及处理所有SocketChannel。ServerSocketChannel打开后监听，Selector循环调用select，阻塞等待IO事件，select到事件后，依据事件类型（accept、read、write）指派其他线程做不同处理。如果是accept事件，创建SocketChannel。NIO之所以是同步，是因为它的accept/read/write方法的内核I/O操作都会阻塞当前线程
 - NIO2，AIO，异步非阻塞。与NIO不同，当进行读写操作时，只须直接调用API的read或write方法即可，read/write方法都是异步的，完成后会主动调用回调函数。在AIO编程中，发出一个事件（accept read write等）之后要指定事件处理类（回调函数）




# Share
### 臧萌老师讲的程序员交流的好处
#### 从输入角度，交流的好处：
 - 获取更多的信息；
 - 理解公司的业务；
 - 加深对行业的理解；
 - 发现新的机会。
#### 输出角度：
 - 赢得自己的声誉；
 - 树立自己的影响力；
 - 赢得同事和经理的信任，承担更大的责任。

