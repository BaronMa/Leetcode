# Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), 
# determine if a person could attend all meetings.

# Example 1:

# Input: [[0,30],[5,10],[15,20]]
# Output: false

class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        
        intervals=sorted(intervals, key=lambda x:x[0])
        
        n=len(intervals)
        i=0
        while i < n-1:
            if intervals[i+1][0]>= intervals[i][1]:
                i+=1
                continue
            else:
                return False
        
        return True
        
# At first, sort the external list by the first element of nested lists, then loop all the nested lists to see if the first 
# element of next lists is greater than or equal to the last element of the former lists. The time complexity if O(nlogn).

# Runtime: 76 ms, faster than 69.64% of Python3 online submissions for Meeting Rooms.
# Memory Usage: 16.1 MB, less than 7.69% of Python3 online submissions for Meeting Rooms.
