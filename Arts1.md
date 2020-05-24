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

### Review


### Tips
java代码精简
避免条件判断
double result;
if(value <= MIN_LIMIT){
        result = MIN_LIMIT;
        } else {
        result = value;
        }

精简
 double result = Math.max(MIN_LIMIT, value);
 
 
利用Map的computeIfAbsent
Map<Integer, List<Integer>> userMap = new HashMap<>();
        for(){
        }
### Share
