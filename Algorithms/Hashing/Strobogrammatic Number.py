# A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
# Write a function to determine if a number is strobogrammatic. The number is represented as a string.

class Solution:
    def isStrobogrammatic(self, num: str) -> bool:
        hashing={'6':'9', '8':'8', '9':'6', '1':'1', '0':'0'}
        return num[::-1]=="".join([hashing[i] for i in num if i in hashing.keys()])
        
# Runtime beats 57.98% of python3 submissions, memory usage beats 100% of python3 submissions.
