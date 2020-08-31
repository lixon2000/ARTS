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
## LevelDB doc <https://github.com/google/leveldb/blob/master/doc/impl.md>  
### 该文是levelDB的实现介绍。介绍了重点模块
 - log：WAL，存储了一系列的最近更新操作。每条update操作都写入当前的.log文件尾部，当文件超过4M时，被转成sorted table（sst文件），然后滚动创建新的log文件。
当前log文件的数据被保存在一个内存结构中，memtable。任何update操作首先被写入log中，然后写入memtable。每个read操作都会首先访问memtable，如果memtable中没有的话再触发磁盘检索。memtable中的数据按照key顺序存储，即有序存储（基于跳表实现）。Log文件是无序的。
 - Sorted tables：按key顺序存储的entry，或Key的删除标记。Sst和memtable一样都是按照key排序的。Sst文件中还包含布隆过滤器，判断key是否存在于此sst文件。
Sorted table按level进行组织。由log文件生成的sst被放在young level，又叫做level-0。当level-0的文件数量超过阈值（通常是4）时，这些level-0的文件将会与level-1中的那些有数据重叠（Key在两个文件中都存在）的文件合并，并生成新的一序列level-1文件。
level-0会包含重复的key，然而，level-1及以上只会包含不同的“非重叠”的keys区间。因为在合并时，level-L中的一个文件，将会和level-(L+1)中那些有keys重叠（覆盖）的文件merged，并生成一组新的level-(L+1)文件。同一个level中，不会有key重叠的sst文件；但是不同level可能会有！
level的级别越低，数据新鲜程度越高。遍历数据时，从level 0开始向高level推进。
 - Manifest：清单。manifest文件中列举了构成每个level的SST文件列表，以及相应的key区间，还包括一些重要的metadata。数据库被重新打开时，Manifest文件被创建。它跟log格式类似，都是以追加的方式写入。
 - Current：存储最新的Manifest文件名的文本文件。
 - LOG和LOG.lod：打印操作日志，一般是level合并日志。


# Tips
#### 字节码执行引擎
 - 栈帧结构：局部变量表、操作数栈、动态连接、方法返回地址、附加信息；
 - 方法调用-解析：在类加载的解析阶段，会将其中的一部分符号引用转化为直接引用，前提是方法在程序真正运行之前就有一个可确定的调用版本。有静态方法、私有方法、实例构造器、父类方法4类，及虚方法中使用final修饰的。解析调用在编译阶段就完全确定。
 - 方法调用-分派：到Java 1.8，Java语言是一门静态多分派、动态单分派的语言。
 - 静态分派（方法重载）：依赖静态类型定位方法执行版本。编译期间选择静态分派目标，实现了方法重载。关注接受者和参数等多个宗量，因此静态分派是多分派。
 - 动态分派（重写）：invokevirtual指令执行的第一步就是在运行期确定接收者的实际类型，然后在自己类中找方法，再从下往上依次对C的各个父类。这种在运行期根据实际类型确定方法执行版本的分派过程称为动态分派。只关注接收者的实际类型一个宗量，因此动态分派是单分派。
 - 动态分派实现：不搜索元数据中的所有方法，而在方法区中加入虚方法表。如果某个方法在子类中没有被重写，那子类的虚方法表里面的地址入口和父类相同方法的地址入口是一致的，都指向父类的实现入口。如果子类中重写了这个方法，子类方法表中的地址将会替换为指向子类实现版本的入口地址。


# Share
### 哈希算法
#### 设计一个哈希算法的要求
 - 从哈希值不能反向推导出原始数据（所以哈希算法也叫单向哈希算法）；
 - 对输入数据非常敏感，哪怕原始数据只修改了一个 Bit，最后得到的哈希值也大不相同；
 - 散列冲突的概率要很小，对于不同的原始数据，哈希值相同的概率非常小；
 - 哈希算法的执行效率要尽量高效，针对较长的文本，也能快速地计算出哈希值。
#### 哈希算法的应用
唯一标识、校验数据的完整性和正确性、安全加密、散列函数、负载均衡、数据分片、分布式存储。
