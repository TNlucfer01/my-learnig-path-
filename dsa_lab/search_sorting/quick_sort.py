def Quick_sort(element,left,right):
    pivaot=right-1
    i=left
    j=right-1
    if left<right:
        while(True):
            while(i<pivaot and element[i]<element[pivaot]):
                i=i+1
            while(element[j]>element[pivaot]):
                j=j-1
            if i<j:
                temp=element[i]
                element[i]=element[j]
                element[j]=temp
            else:
                break
        temp=element[i]
        element[i]=element[pivaot]
        element[pivaot]=temp
        print(element,'mid',i)
        Quick_sort(element,left,i)
        Quick_sort(element,i+1,right)

elements=[1,4,6,3,2,7,9,30,23,21,44]
Quick_sort(elements,0,len(elements))
print(elements)