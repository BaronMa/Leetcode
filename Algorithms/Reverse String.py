# Write a function that reverses a string. The input string is given as an array of characters char[].

# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

# You may assume all the characters consist of printable ascii characters.

# Solution 1:

class Solution:
    def reverseString(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        s.reverse()
        
# Directly use the inbuild method of python that reverses objects of list in place.

# Solution 2:

class Solution:
    def reverseString(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        for i in range(len(s)):
            pop_value=s.pop(-1)
            s.insert(i,pop_value)
            
# Use pop and insert. Loop all the elements of the list and pop the last element each time, then insert the poped value from the beginning of the list.

# Solution 3:
class Solution:
    def reverseString(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        l, r = 0, len(s) - 1
        while l < r:
            s[l], s[r] = s[r], s[l]
            l, r = l + 1, r - 1
            
# Use two pointers methods, loop the list from left and right at the same time, and exchange corrosponding elements.
