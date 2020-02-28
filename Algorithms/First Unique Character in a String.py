# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
# You may assume the string contain only lowercase letters.

# Examples:
# s = "leetcode"
# return 0.
# s = "loveleetcode",
# return 2.

class Solution:
    def firstUniqChar(self, s: str) -> int:
        i=0
        n=len(s)
        if n==1:
            return 0
        while i<n:
            s1 = s[:i] + s[i+1:]
            if s[i] not in s1:
                return i
            else:
                i+=1
        return -1
        
# Iterate all the elements in the string from beginning, as for each item iterated, remove the item from the string and build
# a new string by the remaining characters. Then try to judge whether there are the same item in the new string.

# Runtime: 456 ms, faster than 5.04% of Python3 online submissions
# Memory Usage: 12.9 MB, less than 100.00% of Python3 online submissions 
