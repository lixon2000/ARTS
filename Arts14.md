Arts14
===

# Algorithm
## 136. 只出现一次的数字  <https://leetcode-cn.com/problems/single-number/>
### 描述：给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。说明：你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
### 思路：位操作，异或。
### java实现：
	class Solution {
	    public int singleNumber(int[] nums) {

		int ret = 0;
		for(int num: nums){
			ret = ret ^ num;
		}
		return ret;

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
#### 类加载的过程
 - 加载：1）通过一个类的全限定名来获取定义此类的二进制字节流。（虚拟机以外的类加载器来做）2）将这个字节流所代表的静态存储结构转化为方法区的运行时数据结构。3）在内存中生成一个代表这个类的java.lang.Class对象，作为方法区这个类的各种数据的访问入口。
 - 验证：（文件格式验证、元数据验证、字节码验证、符号引用验证）确保字节流中包含的信息符合当前虚拟机的要求。
 - 准备：准备阶段是正式为类变量分配内存并设置类变量初始值的阶段，这些变量所使用的内存都将在方法区中进行分配。
 - 解析：解析阶段是虚拟机将常量池内的符号引用替换为直接引用的过程。
 - 初始化：到了初始化阶段，才真正开始执行类中定义的Java程序代码（字节码）。初始化阶段是执行类构造器＜clinit＞（）方法的过程。

# Share
### 信息流设计（二）：通用信息流系统的拉模式要如何做？
 - 基于拉模式和推拉结合模式实现信息流系统的方案
 - 在拉模式下，我们只需要保存用户的发件箱，用户的信息流是通过聚合关注者发件箱数据来实现的；
 - 拉模式会有比较大的聚合成本，缓存节点也会存在带宽的瓶颈，所以我们可以通过一些权衡策略尽量减少获取数据的大小，以及部署缓存副本的方式来抗并发；
 - 推拉结合的模式核心是只推送活跃的粉丝用户，需要维护用户的在线状态以及活跃粉丝的列表，所以需要增加多余的空间成本来存储，这个需要来权衡。

