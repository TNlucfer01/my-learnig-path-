#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb  8 17:54:28 2025

@author: darkemperor
"""

import numpy as np

x = np.array([1, 2, 3, 45, 5, 6, 7])
y = np.arange(1, 8)

# Aggregation operations
print("Exponential:", np.exp(x))
print("Sine values:", np.sin(x))
print("Greater comparison:", np.greater(x, y))

# Custom vectorized function
def custom_add(x, y):
    return x + y

vectorized_add = np.frompyfunc(custom_add, 2, 1)
print("Custom vectorized add:", vectorized_add(x, y))

# Arithmetic operations
print("Multiplication:", np.multiply(x, y))
print("Addition:", np.add(x, y))
print("Subtraction:", np.subtract(x, y))
print("Division:", np.divide(x, y))

# Divmod
quotient, remainder = np.divmod(x, y)
print("Quotient:", quotient)
print("Remainder:", remainder)

# Boolean and Bitwise operations
print("x > 2:", x > 2)
x<=3
i = np.arange(0, 7,2)
x[i]
a = np.dtype([("name","U29"),("age","i8"),("fuckyoyu","U20")])
b=np.array([("manoj",18,"human"),("vimal",19,"fatso"),("vasanth",18,"lier")])
print(b)
