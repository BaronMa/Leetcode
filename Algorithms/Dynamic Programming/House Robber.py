# You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, 
# the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and 
# it will automatically contact the police if two adjacent houses were broken into on the same night.

# Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of 
# money you can rob tonight without alerting the police.

class Solution:
    def rob(self, nums: List[int]) -> int:

        x0=0
        x1=0
        for i in nums:
            temp = x1
            x1=max(x0+i, x1)
            x0=temp
        return x1
        
# Dynamic programming solution
# Runtime beats 42.22% python3 submissions and memory usage beats 100% python3 submissions.
