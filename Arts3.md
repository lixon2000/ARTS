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
#### 利用方法引用
普通

        Arrays.sort(nameArray, (a, b) -> a.compareToIgnoreCase(b));

精简

        Arrays.sort(nameArray, String::compareToIgnoreCase);
 
#### Lombok注解
普通

       public class UserV0{
                private int id;
                public void setID(int id){
                        this.id = id;
                }
                public void getID(){
                        return this.id;
                }
       }
               
精简

        @Getter
        @Setter
       public class UserV0{
                private int id;
       }

Lombok注解是在编译时对java代码进行代理，生成的二进制字节码中，便拥有了get、set、toString等方法。Lombok注解必须引入三方包，且安装IDE插件。否则开发过程中会出错。

# Share
耗子叔说的技术领导力总结
 - 第一，你要吃透基础技术。基础技术是各种上层技术共同的基础。这个不细说。
 - 第二，提高学习能力。所谓学习能力，就是能够很快地学习新技术，又能在关键技术上深入的能力。主要体现：学习的信息源；与高手交流；举一反三的思考；不怕困难的态度；开放的心态。
 - 第三，坚持做正确的事。做正确的事，比用正确的方式做事更重要，因为这样才始终会向目的地靠拢。主要体现：提高效率的事；自动化的事；掌握前沿技术的事；知识密集型的事；技术驱动的事。
 - 第四，高标准要求自己。只有不断地提高标准 ，你才可能越走越高，所以，要以高标准要求自己，不断地反思、总结和审视自己，才能够提升自己。


