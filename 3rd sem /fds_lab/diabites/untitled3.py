#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  8 14:12:08 2024

@author: darkemperor
"""

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
sns.set(color_codes=True)
#matplotlib inlineimport warnings
import warnings
warnings.filterwarnings("ignore")
diabetes=pd.read_csv("/home/darkemperor/aathi/my-learnig-path-/fds_lab/diabites/diabetes.csv")
#print(diabetes)
#print(diabetes.describe())

"""
sns.kdeplot(diabetes["Pregnancies"],color="green",shade=True)
plt.show()
plt.figure()


plt.figure(figsize=(6,6))
sns.kdeplot(diabetes["Glucose"],color="green",shade=True)
plt.show()
plt.figure()



plt.figure(figsize=(6,6))
sns.kdeplot(diabetes["Age"],diabetes["BloodPressure"],cmap="RdYlBu",shade=True)
plt.show()
plt.figure()

plt.figure(figsize=(6,6))
sns.kdeplot(x=diabetes.Age,y=diabetes.Glucose,cmap="PRGn",shade=True,bw_adjust=1)
plt.show()

"""
corr=diabetes.corr()
print(corr)




#scatter plot 
import seaborn as sns
sns.scatterplot(x="Pregnancies",y="Glucose",data=corr)

sns.scatterplot(x="Pregnancies",y="Glucose",hue="Outcome",data=corr)

sns.distplot(diabetes["Age"],color="green")
plt.show()
plt.figure()


#scattterplot
sns.kdeplot(diabetes[diabetes.Outcome==0]['Age'],color="blue")
sns.kdeplot(diabetes[diabetes.Outcome==1]['Age'],color="orange")
plt.show()






#print the histogram
dia1=diabetes[diabetes.Outcome==1]
dia0=diabetes[diabetes.Outcome==0]
plt.figure(figsize=(20,6))
plt.subplot(1,3,1)
plt.title("Histogram for glucose")
sns.distplot(diabetes.Glucose,kde=False)
plt.subplot(1,3,2)
sns.distplot(dia0.Glucose,kde=False,color="Gold",label="Gluc for Outcome=0")
sns.distplot(dia1.Glucose,kde=False,color="Blue",label="Gluc for Outcome=1")
plt.title("Histograms for Glucose by Outcome")
plt.legend()
plt.subplot(1,3,3)
sns.boxplot(x=diabetes.Outcome,y=diabetes.Glucose)
plt.title("Boxplot for Glucose by Outcome")





