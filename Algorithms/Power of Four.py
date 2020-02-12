# Given an integer (signed 32 bits), write a function to check whether it is a power of 4.
# Follow up: Could you solve it without loops/recursion?

import math
class Solution:
    def isPowerOfFour(self, num: int) -> bool:
        return False if num <= 0 else math.log(num, 4).is_integer()
        
 # Use log4 and is_integer to output a boolean result
 
 # Runtime: 28 ms, faster than 75.62% of Python3 online submissions
 # Memory Usage: 12.7 MB, less than 100.00% of Python3
