import re 
s="A man, a plan, a canal: Panama"

s=re.sub("[^a-zA-Z0-9]",'',s)
s=s.lower()
a="Square Brackets ([]) represent a character class consisting of a set of characters that we wish to match. For example, the character class [abc] will match any single ab, or c. We can also specify a range of characters using - inside the square brackets. For example,[0, 3] is sample as [0123] [a-c] is same as [abc]"
#a=re.sub("[^a-zA-Z0-9]",'',a)

print(re.findall("[A-Z]+",a))
