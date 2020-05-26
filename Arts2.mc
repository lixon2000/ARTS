Arts1
===

# Algorithm
## LeetCode 3 无重复字符的最长子串 ，<https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/>
### 描述：给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
### 思路：1遍历字符串 2使用滑动窗口，由于从前一个已经遍历的最长字符串中已经包含从后一个字符开始遍历的部分字符串，因此不再重复遍历，降低时间复杂度O(n)
### java实现：

        

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


