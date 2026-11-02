import csv
import sys

# Get the practical maximum integer for your system
max_iterations = sys.maxsize
def is_palindrome(s):
    return s == s[::-1]

with open('binary_palindromes.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['number', 'bin(num)', 'palindrome(bin)', 'dec(pali)', 'is_num_palindrome'])

    for num in range(max_iterations):
        binary = bin(num)[2:]  # Remove '0b' prefix
        binary_pali = binary[::-1]  # Reverse binary
        is_pali = binary == binary_pali
        dec_pali = int(binary_pali, 2)
        is_num_pali = str(num) == str(num)[::-1]  # Check if decimal number is palindrome
        writer.writerow([num, binary, binary_pali, dec_pali, is_num_pali])
