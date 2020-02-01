# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

def twoSum(self, nums: List[int], target: int) -> List[int]:
        dict={}
        for index,value in enumerate(nums):
            if (target - value) not in dict:
                dict[value] = index
            else:
                return [dict[target - value],index]
                
# Runtime beats 57.3% of python3 submissions, memory usage beats 66.05% of python3 submissions.
