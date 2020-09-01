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
### 哈希算法
#### 设计一个哈希算法的要求
 - 从哈希值不能反向推导出原始数据（所以哈希算法也叫单向哈希算法）；
 - 对输入数据非常敏感，哪怕原始数据只修改了一个 Bit，最后得到的哈希值也大不相同；
 - 散列冲突的概率要很小，对于不同的原始数据，哈希值相同的概率非常小；
 - 哈希算法的执行效率要尽量高效，针对较长的文本，也能快速地计算出哈希值。
#### 哈希算法的应用
唯一标识、校验数据的完整性和正确性、安全加密、散列函数、负载均衡、数据分片、分布式存储。

