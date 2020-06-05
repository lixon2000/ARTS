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
### UDP通信相关

- UDP的头中的长度是指整个UDP包的长度，最小为8，即空包；
- UDP的投中的校验和和其他协议的校验和类似，都是反码相加，是一种弱校验的机制；

### java代码精简
直接内存（对外内存，directByteBuff）
内存对象分配在Java虚拟机的堆以外的内存，这些内存直接受操作系统管理（而不是虚拟机），这样做的结果就是能够在一定程度上减少垃圾回收对应用程序造成的影响。使用未公开的Unsafe和NIO包下ByteBuffer来创建堆外内存。
1、	减少了垃圾回收
2、	提升复制速度(io效率)

Unpooled，用来分配非池化的一块内存，可以是堆内的，也可以堆外的（直接的）
零拷贝
Netty中的Zero-copy 与OS层面上的Zero-copy不太一样, Netty的Zero-coyp完全是在用户态(Java 层面)的, 它的Zero-copy的更多的是偏向于优化数据操作这样的概念。
Netty的Zero-copy体现在如下几个个方面：
	Netty提供了CompositeByteBuf 类，它可以将多个 ByteBuf 合并为一个逻辑上的 ByteBuf，避免了各个 ByteBuf 之间的拷贝。
	通过wrap操作，我们可以将 byte[]数组、ByteBuf、ByteBuffer等包装成一个Netty ByteBuf对象，进而避免了拷贝操作。
	ByteBuf 支持slice操作，因此可以将ByteBuf分解为多个共享同一个存储区域的 ByteBuf，避免了内存的拷贝。
	通过 FileRegion 包装的FileChannel.tranferTo实现文件传输，可以直接将文件缓冲区的数据发送到目标Channel，避免了传统通过循环write方式导致的内存拷贝问题。

 


# Share
耗子叔说的技术领导力总结
 - 第一，你要吃透基础技术。基础技术是各种上层技术共同的基础。这个不细说。
 - 第二，提高学习能力。所谓学习能力，就是能够很快地学习新技术，又能在关键技术上深入的能力。主要体现：学习的信息源；与高手交流；举一反三的思考；不怕困难的态度；开放的心态。
 - 第三，坚持做正确的事。做正确的事，比用正确的方式做事更重要，因为这样才始终会向目的地靠拢。主要体现：提高效率的事；自动化的事；掌握前沿技术的事；知识密集型的事；技术驱动的事。
 - 第四，高标准要求自己。只有不断地提高标准 ，你才可能越走越高，所以，要以高标准要求自己，不断地反思、总结和审视自己，才能够提升自己。


