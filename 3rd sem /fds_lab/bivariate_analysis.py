#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  1 14:14:10 2024

@author: darkemperor
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets,linear_model
from sklearn.metrics import mean_squared_error,r2_score
#Load the diabetes dataset
diabetes_X,diabetes_y=datasets.load_diabetes(return_X_y=True)
#Use only one feature
diabetes_X=diabetes_X[:,np.newaxis,2]
#Split the data into training and testing sets
diabetes_X_train=diabetes_X[:-50]
diabetes_X_test=diabetes_X[:-50]
#Split the targets into training and testing data sets
diabetes_y_train=diabetes_y[:-50]
diabetes_y_test=diabetes_y[:-50]
#Create linear regression object
regr=linear_model.LinearRegression()
#Train the model using the training sets.
regr.fit(diabetes_X_train,diabetes_y_train)
# Make predictions using the testing set
diabetes_y_pred=regr.predict(diabetes_X_test)
print("Coefficients:\n",regr.coef_)
#to print the mean sqyared error
print("Mean Squared Error:%2f"%mean_squared_error(diabetes_y_test,diabetes_y_pred))

#to fins the coefficient of determination
print("Coefficients of Detemination:%2f"%r2_score(diabetes_y_test,diabetes_y_pred))

#to plot the output
plt.scatter(diabetes_X_test,diabetes_y_test,color="blue")
plt.plot(diabetes_X_test,diabetes_y_pred,color="black",linewidth=3)
plt.xticks(())
plt.yticks(())
plt.show()
