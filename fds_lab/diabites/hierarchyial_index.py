#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb  8 19:13:55 2025

@author: darkemperor
"""
import numpy as np
import pandas as pd

"""hierarchical indexing """

# Define multi-index levels
arrays = [
    ['Aathi', 'Aathi', 'Lucy', 'Lucy'],
    ['Math', 'Science', 'Math', 'Science']
]
index = pd.MultiIndex.from_arrays(arrays, names=('Student', 'Subject'))

# Create a DataFrame
data = pd.DataFrame(
    np.random.randint(50, 100, (4, 2)),
    index=index,
    columns=['Term 1', 'Term 2']
)
print(data)

print(data.loc[('Aathi', 'Term 1')])
# Average score per subject across students
print(data.groupby(level='Subject').mean())


# Average score per subject across students
print(data.groupby(level='Student').sum())
