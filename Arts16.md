Arts16
===

# Algorithm
## 122. 买卖股票的最佳时机 II  <https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/>
### 描述：给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
### 思路：只叠加上升中的价格差。
### java实现：
	public class BestTime2BuyStock2 {
    public int maxProfit(int[] prices) {

    	if(prices.length == 0){
    		return 0;
    	}
    	
    	int maxProfit = 0;		// 利润和
    	int prePrice = prices[0];
    	
    	for(int price: prices){
    		// 一旦低于前一天价格，则增加maxProfit
    		if(price > prePrice){
    			// 上升坡
    			maxProfit += (price - prePrice);
    		} else{
    			// 下降坡
    		}
    		prePrice = price;
    	}
    	
    	return maxProfit;
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


