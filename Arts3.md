Arts3
===

# Algorithm
## LeetCode 9 回文数 ，<https://leetcode-cn.com/problems/palindrome-number/>
### 描述：判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
### 思路：从数字中间阶段，检查是否左右对称，循环终止的条件是反转的数字大于正向的数字。
### java实现：

    class Solution {
          public boolean isPalindrome(int x) {
               if(x < 0){
                   return false;
               }

               if(x == 0){
                   return true;
               }

               if(x%10 == 0){
                   return false;
               }

               int y = 0;
               while(y < x){
                   y = y*10 + x%10;
                   x /= 10;
               }

               if((x == y) || (x == y/10)){
                   return true;
               } else{
                   return false;
               }
           }
    }        

# Review
What makes a programming exercise good?  
<https://jvns.ca/blog/2019/11/20/what-makes-a-programming-exercise-good/>  
什么让编程练习更好：  
- it’s fun  
- it teaches you something you care about
- it’s a challenge
- you can tell if you succeeded
- you can do it quickly
- the author believes in you
- it’s been tested
- you won’t get stuck
- it’s easy to get help
- no time-consuming setup required
- it’s easy to extend

# Tips
### Netty
#### 直接内存（对外内存，directByteBuff）
内存对象分配在Java虚拟机的堆以外的内存，这些内存直接受操作系统管理（而不是虚拟机），这样做的结果就是能够在一定程度上减少垃圾回收对应用程序造成的影响。使用未公开的Unsafe和NIO包下ByteBuffer来创建堆外内存。
 - 1、	减少了垃圾回收
 - 2、	提升复制速度(io效率)

Unpooled，用来分配非池化的一块内存，可以是堆内的，也可以堆外的（直接的）

#### 零拷贝
Netty中的Zero-copy 与OS层面上的Zero-copy不太一样, Netty的Zero-coyp完全是在用户态(Java 层面)的, 它的Zero-copy的更多的是偏向于优化数据操作这样的概念。Netty的Zero-copy体现在如下几个个方面：
 - Netty提供了CompositeByteBuf 类，它可以将多个 ByteBuf 合并为一个逻辑上的 ByteBuf，避免了各个 ByteBuf 之间的拷贝。
 - 通过wrap操作，我们可以将 byte[]数组、ByteBuf、ByteBuffer等包装成一个Netty ByteBuf对象，进而避免了拷贝操作。
 - ByteBuf 支持slice操作，因此可以将ByteBuf分解为多个共享同一个存储区域的 ByteBuf，避免了内存的拷贝。
 - 通过 FileRegion 包装的FileChannel.tranferTo实现文件传输，可以直接将文件缓冲区的数据发送到目标Channel，避免了传统通过循环write方式导致的内存拷贝问题。

#### ByteBuf的计数
 - 源码中很多地方有ReferenceCountUtil.release(cast)，将ByteBuf的引用计数减1，当减到0时，内存将被释放，此时再调用会引起IllegalReferenceCountException。因此遇到这种情况，需要使用ByteBuf.retain()，使计数增加。


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

