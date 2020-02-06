# You are climbing a stair case. It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Note: Given n will be a positive integer.

class Solution:
    def climbStairs(self, n: int) -> int:
        if n==1:
            return 1
        dp=[0]*n
        dp[0]=1
        dp[1]=2
        for i in range(2,n,1):
            dp[i]=dp[i-1]+dp[i-2]
            
        return dp[n-1]
        
# Dynamic programming approach can be used to solve this problem since this is a subproblem obviously: there are two ways 
# we can climb to the ith stair, one is taking 1 step from the (i-1)th stair, the other is taking 2 steps from the (i-2)th
# Stair, whic means dp[i]=dp[i-1]+dp[i-2].

# Runtime beats 58.49% python3 submissions and memory usage beats 100% python3 submissions.
