# Given a string s and a string t, check if s is subsequence of t.
# You may assume that there is only lower case English letters in both s and t. t is potentially a very long (length ~= 
# 500,000) string, and s is a short string (<=100).

# A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the 
# characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" 
# while "aec" is not).

class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        sub=''
        n=len(t)
        m=len(s)
        i=0
        j=0
        while i<n and j<m:
            if t[i] == s[j]:
                j+=1
                sub+=t[i]
                i+=1
            else:
                i+=1

        if sub==s:
            return 1
        else:
            return 0
            
# It is a O(n) solution.
# Loop all the items in t, when an item is in s, s moves to next and i also moves to next item, if the item isn't found in s
# t moves to next item.

# Runtime: 208 ms, faster than 40.58% of Python3 online submissions
# Memory Usage: 17.3 MB, less than 26.67% of Python3 online submissions 
