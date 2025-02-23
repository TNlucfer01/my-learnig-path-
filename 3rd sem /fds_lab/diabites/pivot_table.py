#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb  8 19:35:18 2025

@author: darkemperor
"""

import pandas as pd

# Sample dataset
data = pd.DataFrame({
    'Student': ['Aathi', 'Lucy', 'Aathi', 'Lucy', 'Aathi'],
    'Subject': ['Math', 'Math', 'Science', 'Science', 'Math'],
    'Term': ['T1', 'T1', 'T1', 'T2', 'T2'],
    'Score': [88, 92, 79, 85, 94]
})

pivot_table = pd.pivot_table(data,
                              values='Score',
                              index='Student',
                              columns='Term',
                              aggfunc='std'
                              )

print(pivot_table)
print(data)
