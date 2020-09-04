Arts15
===

# Algorithm
## 88. 合并两个有序数组  <https://leetcode-cn.com/problems/merge-sorted-array/>
### 描述：给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
### 思路：双指针从后向前填充。
### java实现：
	class Solution {
      public void merge(int[] nums1, int m, int[] nums2, int n) {


        // 指向最后
        int p1 = m-1;
        int p2 = n-1;

        int p = m+n-1;

        while(p1 >= 0 && p2 >= 0){
          int max = 0;		// 大的数
          if(nums1[p1] > nums2[p2]){
            max = nums1[p1];
            p1--;
          } else{
            max = nums2[p2];
            p2--;
          }
          nums1[p] = max;
          p--;
        }

        // nums2剩余部分
        if(p2 >= 0){
          System.arraycopy(nums2, 0, nums1, 0, p2+1);
        }

      }
  	}
	
# Review
## Linux debugging tools I love <https://jvns.ca/blog/2016/07/03/debugging-tools-i-love/>  
#### 该文列举了作者最喜欢的几个Linux下调试的工具
 - strace，跟踪系统调用；
 - dstat，每秒打印来自网络写入磁盘的数据量；
 - tcpdump+wiredshark，打印网络包；
 - perf，打印C程序的占用CPU时间；
 - opensnoop，展示当前计算机上有哪些打开的文件；


# Tips
#### 动态代理
 - Jdk和cglib的区别：jdk的动态代理利用反射实现了一个给定接口的匿名类，生成了字节码，这个匿名类中，每个方法都会调用父类中InvocationHandler的invoke方法。Cglib使用字节码引擎ASM，将代理类Class加载进来，修改其字节码实现一个子类。
 - Cglib可以对类和接口进行代理，通过Enhancer创建一个类的子类，在子类的方法被调用时，进行拦截。
 - 除了Enhancer外，Cglib还可以用ImmutableBean创建不可能改的对象、拷贝不同对象的BeanCopier、用BeanGenerator操纵字节码创建任意bean对象、BeanMap、BulkBean等。KeyFactory生成接口的实例，Mixin合并接口



# Share
### 深入理解虚拟机实战:修改class文件实现System标准输出重定向 https://blog.csdn.net/qq_35603331/article/details/79773843####
 - 如果想Hack一个已经编译好的java进程，前提是不修改源代码，要怎么做？可以通过修改其中一个类的字节码class文件。
 - 如果熟悉字节码，可以直接对其二进制流读入，然后修改再保存成新的二进制流。这样能够将class文件修改成自己想要的样子，但难度非常大。一种简单的方式是，创建一个基础类代替java库中的基础类，例如System，然后字节码修改常量池中，其引用的基础类的名字。
 - 字节码修改后怎样执行呢，可以新建一个ClassLoader，用其方法的反射来执行。


