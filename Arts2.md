Arts2
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
#### 避免条件判断
普通

        double result;
        if(value <= MIN_LIMIT){
                result = MIN_LIMIT;
        } else {
                result = value;
        }

精简

         double result = Math.max(MIN_LIMIT, value);
 
#### 利用Map的computeIfAbsent
普通

        Map<Integer, List<Integer>> userMap = new HashMap<>();
        public addUser(int type, int uid){
                List<Integer> list = userMap.get(type);
                if(list == null){
                        list = new LinkedList<>();
                        userMap.put(type, list);
                }
                list.add(uid);
        }
        
精简

        Map<Integer, List<Integer>> userMap = new HashMap<>();
        public addUser(int type, int uid){
                userMap.computeIfAbsend(type, key -> new LinkedList<>()).add(a);
        }
        
### Share
：
- 生产线上问题优先级最高，可查到头部；
- 安全问题一般比较优先；


