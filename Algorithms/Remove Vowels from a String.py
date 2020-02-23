# Given a string S, remove the vowels 'a', 'e', 'i', 'o', and 'u' from it, and return the new string.
# S consists of lowercase English letters only.
# 1 <= S.length <= 1000

class Solution:
    def removeVowels(self, S: str) -> str:
        if len(S)==0:
            return S
        vowels=['a', 'e', 'i', 'o', 'u']
        for i in vowels:
            S = S.replace(i,'')
            
        return S
        
 # List all the lowercase vowels. Loop each item of these five vowels, if any item matches the exist vowels in the string, 
 # replace them with empty element.
 
 # Runtime: 24 ms, faster than 85.71% of Python3 online submissions.
 # Memory Usage: 12.7 MB, less than 100.00% of Python3 online.
