# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

def twoSum(self, nums: List[int], target: int) -> List[int]:
        dict={}
        for index,value in enumerate(nums):
            if (target - value) not in dict:
                dict[value] = index
            else:
                return [dict[target - value],index]
# Store all the values as key and their corresponding index as value in a dictionary, then each time, we only need to check if 
# the difference between target and value is in the dictionary or not, if not, assign the new value and index pair to the 
# dictionary, if so, return the difference's value and the index.
                
# Runtime beats 57.3% of python3 submissions, memory usage beats 66.05% of python3 submissions.
