Arts1
===

### Algorithm
LeetCode 3

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
