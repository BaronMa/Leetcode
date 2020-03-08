# Given m arrays, and each array is sorted in ascending order. Now you can pick up two integers from two different arrays 
# (each array picks one) and calculate the distance. We define the distance between two integers a and b to be their absolute 
# difference |a-b|. Your task is to find the maximum distance.

# Note:
# Each given array will have at least 1 number. There will be at least two non-empty arrays.
# The total number of the integers in all the m arrays will be in the range of [2, 10000].
# The integers in the m arrays will be in the range of [-10000, 10000].

import numpy as np
class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        m=min(arrays[0])
        i=0
        for s in arrays[1:]:
            if min(s) < m:
                m=min(s)
                i=arrays.index(s)
        
        lst1=arrays[:i] + arrays[i+1:]
        n=max(lst1[0])
        for k in lst1:
            if max(k) > n:
                n=max(k)
                
        nn=max(arrays[0])
        jj=0
        for k in arrays[1:]:
            if max(k) > nn:
                nn=max(k)
                jj=arrays.index(k)
                
        
        lst2=arrays[:jj]+arrays[jj+1:]
        mm=min(lst2[0])
        for s in lst2:
            if min(s) < mm:
                mm=min(s)

        if np.abs(nn-mm) >= np.abs(n-m):
            return np.abs(nn-mm)
        else:
            return np.abs(n-m)
            
# Loop all the nested lists and all the elements in each nested list to find the minmal and maximal values. In order to avoid 
# the condition that the minimal value and the maximum occur in the same nested list, the first time I choose minimum first 
# the then remove the nested list with the minimum form the given array and choose maximum; the second time I choose maximum
# first and then remove the nested list with the maximum from the given array and choose the minimum.

# Runtime: 244 ms, faster than 5.58% of Python3 online submissions
# Memory Usage: 31.2 MB, less than 50.00% of Python3 online submissions 
