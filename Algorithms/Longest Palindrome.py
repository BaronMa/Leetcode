# Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that 
# can be built with those letters.

# This is case sensitive, for example "Aa" is not considered a palindrome here.

class Solution:
    def longestPalindrome(self, s: str) -> int:
        a=0
        news=s
        for i in s:
            m=s.count(i)
            s=s.replace(i,'')
            if m % 2 == 0:
                a+=m
            elif m>1:
                a+=m-1
                
        if a<len(news):
            a=a+1
        return a
        
# Count the frequency of distinct characters in s (that's why after counting, I removed the all the same characters from s), 
# if any character occured more than 1 time, it can be used to form the palindrome. There are two cases, if the frequency of 
# occurence is even times, add the frequency to the length of the palindrome; if the frequency is odd times, add the largest 
# even number. Finally, if the length of the palindrome less than the length of s, we can always add a character whose frequency
# was 1 in s to form a 1-char longer palindrome.
