def bubble_sort(elemnets,numbers):
    for i in range(numbers):
        for j in range(1,numbers-i):
            if(elemnets[j-1]>elemnets[j]):
                #swap
                temp=elemnets[j-1]
                elemnets[j-1]=elemnets[j]
                elemnets[j]=temp

    print("Display")
    print(elemnets)

elements=[1,4,2,7,5,10,5]
number=len(elements)
bubble_sort(elements,number)
