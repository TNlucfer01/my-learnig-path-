def merge_sort(elements, temp, array_size):
    m_sort(elements, temp, 0, array_size - 1)

def m_sort(elements, temp, left, right):
    if right > left:
        mid = (left + right) // 2
        m_sort(elements, temp, left, mid)
        m_sort(elements, temp, mid + 1, right)
        merge(elements, temp, left, mid + 1, right)

def merge(elements, temp, left, mid, right):
    left_end = mid - 1
    temp_pos = left
    num_elements = right - left + 1

    # Merge elements into temp
    while (left <= left_end) and (mid <= right):
        if elements[left] <= elements[mid]:
            temp[temp_pos] = elements[left]
            left += 1
        else:
            temp[temp_pos] = elements[mid]
            mid += 1
        temp_pos += 1

    # Copy remaining elements from the left half, if any
    while left <= left_end:
        temp[temp_pos] = elements[left]
        left += 1
        temp_pos += 1

    # Copy remaining elements from the right half, if any
    while mid <= right:
        temp[temp_pos] = elements[mid]
        mid += 1
        temp_pos += 1

    # Copy temp back to elements
    for i in range(num_elements):
        elements[right] = temp[right]
        right -= 1
    
    print(f"{elements}")

elements = [5, 3, 7, 8, 1, 2, 9]
array_size = len(elements)
temp = [0] * array_size
merge_sort(elements, temp, array_size)
print("Final sorted elements:\n", elements)
