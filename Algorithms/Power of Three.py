# Given an integer, write a function to determine if it is a power of three.
import math
class Solution:
    def isPowerOfThree(self, n: int) -> bool:
        if n<=0:
            return 0
        while n%3==0:
            n=n/3
        return n==1
        
# Recursively divide by 3, check that the remainder is zero and re-apply to the quotient.
# We can also use 1162261467 % n == 0, since 3^19=1162261467, which is the biggest numeric value of 32 bit.

# Runtime: 60 ms, faster than 96.70% of Python3 online submissions
# Memory Usage: 12.8 MB, less than 100.00% of Python3 online submissions 
