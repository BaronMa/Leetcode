# Given string S and a dictionary of words words, find the number of words[i] that is a subsequence of S.

# Example :
# Input: 
# S = "abcde"
# words = ["a", "bb", "acd", "ace"]
# Output: 3
# Explanation: There are three words in words that are a subsequence of S: "a", "acd", "ace".

class Solution:
    def is_subseq(self, x, y):
        p = -1
        for ch in x:
            p = y.find(ch, p+1)
            if p == -1:
                return False
        return True
    
    def numMatchingSubseq(self, S: str, words: List[str]) -> int:
        s=0
        for i in words:
            if self.is_subseq(i,S):
                s+=1
                
        return s
        
 # First define a function to see if the item of words is the subsequence of S. In the function, I used find and the start
 # position to check each character of each item of words is in S. Since find method can get the start position of the string
 # when the looped character is matching the char in the string. If a character of item doesn't exist in the string, it is means
 # the item isn't the subsequence of S.
 
 # Runtime: 324 ms, faster than 91.94% of Python3 online submissions
 # Memory Usage: 14.1 MB, less than 100.00% of Python3 online submissions 
