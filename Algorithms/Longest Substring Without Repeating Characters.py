# Given a string, find the length of the longest substring without repeating characters.

    def lengthOfLongestSubstring(self, s: str) -> int:
        if len(s)==0:
            return 0
        n=len(s)
        i=0
        dp=''
        ccc=''
        dpp=[]

        while i<n:
            if s[i] not in list(dp):
                dp=dp+s[i]
                #dpp.append(dp)
            else:
                if dp[-1]==s[i]:
                    dp=s[i]
                else:
                    j=-1
                    ccc=dp
                    dp=s[i]
                    while -j<=len(ccc):
                        if ccc[j]!=s[i]:
                            dp=dp+ccc[j]
                            j=j-1
                        else:
                            break
                    dp=dp[::-1]
            dpp.append(dp)
            i=i+1
            
        print(dpp)
        
        return len(max(dpp, key=len))
        
# Runtime beats 9.15% python3 submissions.
