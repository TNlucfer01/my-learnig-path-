#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  1 15:19:35 2024

@author: darkemperor
"""

#import libraries
import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn import metrics
import statsmodels.api as sm
import warnings
warnings.filterwarnings('ignore')
#Loading data
df=pd.read_csv("/home/darkemperor/aathi/my-learnig-path-/fds_lab/diabites/diabetes.csv")
#print(df)
#Calculate the correlation matrix
#corr=df.corr()
#Display the correlation matrix
#print(corr)
#to display the cor in a heat map 
#sns.heatmap(corr,xticklabels=corr.columns,yticklabels=corr.columns,cmap='RdBu')


#Train/test split
X=df.drop("Outcome",axis=1)
Y=df[["Outcome"]]
X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=0.25,random_state=0)
from sklearn.linear_model import LinearRegression
#create a linear regression model object
model=LinearRegression()
#pass through X_train and Y_train data set
model.fit(X_train,Y_train)
#grab the coefficient of our model and the intercept
intercept=model.intercept_[0]
coefficient=model.coef_[0][0]
"""print("The intercept for our model is {:.4}".format(intercept))
print(X.columns)
print("The Coefficients for the above given data are:")
print(model.coef_[0])

"""
#to predict 
Y_predict=model.predict(X_test)
#print(y_predict[:5])
X2=sm.add_constant(X)
#create OLS model
model=sm.OLS(Y,X2)
#fit the data
est=model.fit()
#print out a summary
#print(est.summary())
#print(est.conf_int())
print(est.pvalues)

from sklearn.metrics import mean_squared_error,mean_absolute_error
import math
#calculate the mean squared error
model_mse=mean_squared_error(Y_test,Y_predict)
#calculate the mean absolute error
model_mae=mean_absolute_error(Y_test,Y_predict)
#calculate the root mean squared error
model_rmse=math.sqrt(model_mse)
print("Mean Squared Error {:.3}".format(model_mse))
print("Mean Absolute Error {:.3}".format(model_mae))
print("Root Mean Squared Error {:.3}".format(model_rmse))
