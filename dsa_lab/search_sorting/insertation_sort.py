def insertion_sort(elements, numbers):
    for i in range(1, numbers):
        temp = elements[i]
        j = i
        while j > 0 and temp < elements[j - 1]:  # Ensure j > 0 to avoid out-of-bounds
            elements[j] = elements[j - 1]  # Move element up
            j -= 1
        elements[j] = temp  # Insert temp at the correct position
    print("Sorted elements:")
    print(elements)

elements = [1, 4, 3, 6, 100, 8]
number = len(elements)
insertion_sort(elements=elements, numbers=number)
