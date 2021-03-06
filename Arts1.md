Arts1
===

# Algorithm
## LeetCode 3 无重复字符的最长子串 ，<https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/>
### 描述：给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
### 思路：1遍历字符串 2使用滑动窗口，由于从前一个已经遍历的最长字符串中已经包含从后一个字符开始遍历的部分字符串，因此不再重复遍历，降低时间复杂度O(n)
### java实现：

        class Solution {
            public int lengthOfLongestSubstring(String s) {
                if(s.length() == 0){
                    return 0;
                }
                int maxLen = 1;
                Set<Character> strSet = new HashSet<Character>();

                // i是s前面的index，j是s后面的index

                int j=0;
                for(int i=0; i<s.length(); i++){

                    while(j<s.length()){
                        Character c = s.charAt(j);

                        if(strSet.contains(c)){
                            strSet.remove(s.charAt(i));
                            break;
                        } else{
                            strSet.add(c);
                        }

                        int newMaxLen = j-i+1;
                        if(newMaxLen > maxLen){
                            maxLen = newMaxLen;
                        }

                        j++;
                    }
                }

                return maxLen;
            }
        }

# Review
The Myth of the Myth of the 10x Programmer  
<https://payne.org/blog/the-myth-of-the-myth-of-the-10x-programmer/?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website>  
对于同一个问题，普通程序员立刻埋头写大量代码，耗时两周；厉害的程序员在网上点几下鼠标注册了某个免费的SaaS工具，耗时5分钟。对于脑力劳动者来说，知道“该按哪个正确的按钮”比盲目堆砌时间埋头苦干要有用得多。

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
看了臧萌老师的职场求生攻略->优先级，对我自己的工作优先级进行了梳理，今后要在这几个方面进行排序：
- 生产线上问题优先级最高，可查到头部；
- 安全问题一般比较优先；
- 大的模块开发优先级由经理决定；
- 涉及公司的kpi的工作，适当优先；
- 合作过程中，不能阻塞别人的开发；
- 合作开发先约定API和协议；
- 沟通相关工作要放在独立开发工作之前；

