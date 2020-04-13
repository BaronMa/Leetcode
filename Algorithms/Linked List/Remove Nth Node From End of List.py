# Given a linked list, remove the n-th node from the end of list and return its head.

# Example:

# Given linked list: 1->2->3->4->5, and n = 2.

# After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:Given n will always be valid.

class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def removeNthFromEnd(self, head: ListNode, n: int) -> ListNode:
        lag = delay = head
        
        for i in range(n):
            delay = delay.next
            
        if not delay:
            return head.next
        
        while delay.next != None:
            lag = lag.next
            delay = delay.next
            
            
        lag.next = lag.next.next
        return head
        
# The core is to find the (L-n+1)th node in head. At first, one pointer move to the nth node, then use the point to move to the end
# and there will be (L-n) node, the other point moves to the (L-n)th node. Finally, jump from the next node of the other pointer 
# to the next next node.

# Runtime: 32 ms, faster than 60.01% of Python3 online submissions for Remove Nth Node From End of List.
# Memory Usage: 13.8 MB, less than 6.06% of Python3 online submissions for Remove Nth Node From End of List.
