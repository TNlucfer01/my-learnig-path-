#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  8 14:12:06 2024

@author: darkemperor
"""

import numpy as np
import pandas as pd
from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import matplotlib
import functools
import plotly.express as px
import plotly.graph_objects as go
import warnings
warnings.filterwarnings("ignore")
diabetes=pd.read_csv("/home/darkemperor/aathi/my-learnig-path-/fds_lab/diabites/diabetes.csv")
x=diabetes.Age[:20]
y=diabetes.Glucose[:20]
def f(x, y):
    return np.sin(np.sqrt(x ** 2 + y ** 2))
x = np.linspace(-6, 6, 30)
y = np.linspace(-6, 6, 30)
X, Y = np.meshgrid(x, y)
Z = f(X, Y)
fig = plt.figure(figsize=(6,6))
ax = plt.axes(projection ='3d')
ax.contour3D(X, Y, Z,50,cmap='binary')
ax.set_xlabel('Age')
ax.set_ylabel('Glucose')
ax.set_zlabel('z')


fig = plt.figure(figsize=(6,6))
ax = plt.axes(projection ='3d')
ax.plot_surface(X, Y, Z,rstride=1,cstride=1,cmap='viridis',edgecolor='none')
ax.set_xlabel('Age')
ax.set_ylabel('Glucose')
ax.set_zlabel('z')



fig = plt.figure(figsize=(6,6))
ax = plt.axes(projection ='3d')
ax.scatter(X, Y, Z,cmap='viridis',linewidth=0.5)
ax.set_xlabel('Age')
ax.set_ylabel('Glucose')
ax.set_zlabel('z')