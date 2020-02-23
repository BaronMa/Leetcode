# Write a function that takes a string as input and reverse only the vowels of a string.

# Example 1:
# Input: "hello"
# Output: "holle"

# Use two pointers method.
class Solution:
    def reverseVowels(self, s: str) -> str:
        
        vowels=['a', 'e', 'i', 'o', 'u', 'A', 'E', "I", 'O', 'U'] # List all the vowels in a list
        if len(s)==0:
            return ''
        if len(s)==1:
            return s
        
        s=list(s) # Since string is immutable, convert the string to list
        i=0
        j=len(s)-1
        while i<j:
            if s[i] in vowels:
                if s[j] in vowels:
                    s[i], s[j] = s[j], s[i] # Swap the two vowels
                    # temp=s[i]
                    # s[i]=s[j]
                    # s[j]=temp
                    i+=1
                    j-=1
                else:
                    j-=1
            else:
                i+=1
            
        return ''.join(s)
        
# Runtime: 64 ms, faster than 42.57% of Python3 online submissions.
# Memory Usage: 13.7 MB, less than 100.00% of Python3 online.
