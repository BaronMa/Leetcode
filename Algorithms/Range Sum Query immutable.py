# Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
# Example:

# Given nums = [-2, 0, 3, -5, 2, -1]

# sumRange(0, 2) -> 1
# sumRange(2, 5) -> -1
# sumRange(0, 5) -> -3

class NumArray:

    def __init__(self, nums: List[int]):
        if len(nums) == 0:
            self.s = [0]
            return
        elif len(nums) == 1:
            self.s = [nums[0]]
        else:
            self.s = [nums[0]]
            for i in range(1, len(nums)):
                self.s.append(self.s[i - 1] + nums[i])

    def sumRange(self, i: int, j: int) -> int:
        if i == 0:
            return self.s[j]
        
        return self.s[j] - self.s[i - 1]

# Initially calculate the cumulative summation of every item in the NumArray and minus the summation before indice i.

# Runtime: 80 ms, faster than 70.05% of Python3 online submissions
# Memory Usage: 16.2 MB, less than 100.00% of Python3 online
