# Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

# Example: 
# MovingAverage m = new MovingAverage(3);
# m.next(1) = 1
# m.next(10) = (1 + 10) / 2
# m.next(3) = (1 + 10 + 3) / 3
# m.next(5) = (10 + 3 + 5) / 3

class MovingAverage:

    def __init__(self, size: int):
        """
        Initialize your data structure here.
        """
        self.size=size
        self.queue=[]
        self.length=0
        self.total=0

    def next(self, val: int) -> float:
        if self.length<self.size:
            self.queue.append(val)
            self.total+=val
            self.length+=1
            
        else:
            pop_value=self.queue[0]
            self.queue.pop(0)
            self.queue.append(val)
            self.total=self.total-pop_value+val
        
        return self.total/self.length


# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage(size)
# param_1 = obj.next(val)

# At first, the data structure we need is the size, the queue, the length and the total value; then we should judge whether 
# the length of the stream is larger than the size or not. If the length of stream is less than the size, append the value to 
# the queue and add it to the total; if the length of stream is greater or equal to the size, pop the first item of the queue
# then append the new val to the queue, substract the poped item from total, then add the new value to the total.

# Runtime: 64 ms, faster than 83.33% of Python3 online submissions
# Memory Usage: 15.7 MB, less than 100.00% of Python3 online submissions.
