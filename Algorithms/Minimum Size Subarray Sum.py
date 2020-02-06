# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of 
# which the sum ≥ s. If there isn't one, return 0 instead.

import math
class Solution:
    def minSubArrayLen(self, s: int, nums: List[int]) -> int:

        l = 0
        r = 0
        a = math.inf
        summation = 0
        n=len(nums)
        while l < n and r < n:
            # increase right pointer until sum >= s 
            while summation < s and r < n:
                summation += nums[r]
                r += 1
            # increase left pointer until sum < s
            while summation >= s:
                a = min(a, r - l)
                summation -= nums[l]
                l += 1
        return a if a != math.inf else 0
        
# Use two pointers solution, when the summation of the subarray is less than s, increase the right point until the summation is
# greater or equal to s; then increase the left pointer in order to lower the summation to less than s in the meantime update 
# the length of subarrays which satisfy the requirement.

# The runtime beats 70.41% python3 submissions and memory usage less than 7.69% python3 submissions.
