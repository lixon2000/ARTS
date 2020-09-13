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
## IP addresses & routing <https://jvns.ca/blog/2018/07/24/ip-addresses-routing/>  
#### 该文阐述了关于IP地址和路由的几个观点
 - IP头；
 - 子网；
 - 本地创建一个ip包，发生了什么：route table；iptables；IPSec；
 - AWS上的几点注意事项，VPC上管理路由的方式；


# Tips
#### 动态代理
 - synchronized关键字:代码层面上是锁住一个对象，该对象锁定区间内只允许一个线程访问。编译成字节码后，synchronized区间被一对字节码指令包围，前面是monitorenter，后面是monitorexit，每次monitorernter时需要判断monitor是否被其他线程占用，如果占用了，该线程被block，放入monitor队列。实现上，每个对象有一个监视器，监视器有个计数器，monitorenter时，计数器加一，monitorexit时，计数器减一。对内存模型来说，monitorenter时，主内存lock，此后不能对该区域主内存访问。



# Share
### 深入理解虚拟机实战:修改class文件实现System标准输出重定向 https://blog.csdn.net/qq_35603331/article/details/79773843####
 - 如果想Hack一个已经编译好的java进程，前提是不修改源代码，要怎么做？可以通过修改其中一个类的字节码class文件。
 - 如果熟悉字节码，可以直接对其二进制流读入，然后修改再保存成新的二进制流。这样能够将class文件修改成自己想要的样子，但难度非常大。一种简单的方式是，创建一个基础类代替java库中的基础类，例如System，然后字节码修改常量池中，其引用的基础类的名字。
 - 字节码修改后怎样执行呢，可以新建一个ClassLoader，用其方法的反射来执行。


