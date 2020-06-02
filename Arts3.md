Arts3
===

# Algorithm
## LeetCode 7 整数反转 ，<https://leetcode-cn.com/problems/reverse-integer/>
### 描述：给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。注意:假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
### 思路：通过余数按位累积。主要是溢出返回0的处理。
### java实现：


        class Solution {
            public int reverse(int x) {
                long ret = 0;
                while(x != 0){
                        int i = x%10;
                        ret = ret*10 + i;
                        x = x/10;
                }

                int retInt = (int)ret;
                retInt = ((retInt == ret)? (int)retInt: 0);             // 溢出处理
                return retInt;
            }
        }
        

# Review
Architecture Jams: a Collaborative Way of Designing Software  
<https://blog.pragmaticengineer.com/software-architecture-jams/>  
该文讲述了架构统统的方法，几点建议  
- Be mindful of who you invite.  
- Start with the goal
- Lay out constraints and principles
- Use a (virtual) whiteboard
- Present your proposal
- Step back and give space to others
- Facilitate the meeting
- Commit after addressing disagreements
- Close with a clear outcome
- Summarize with notes

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


