# Given a 32-bit signed integer, reverse digits of an integer.

# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: 
# [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

    def reverse(self, x: int) -> int:
        if x >= 0:
            x_list = list(map(int, str(x)))
            x_reverse = x_list[::-1]
            num = int(''.join(map(str,x_reverse)))
            if -2**31 <= num <= 2**31-1:
                return num
            else: 
                return 0
        else:
            x = x*(-1)
            x_list = list(map(int, str(x)))
            x_reverse = x_list[::-1]
            num = int(''.join(map(str,x_reverse)))
            if -2**31 <= num <= 2**31-1:
                return num*(-1)
            else:
                return 0
                
# Runtime beats 51.70% of python3 submissions, memory usage beats 100% of python3 submissions.
