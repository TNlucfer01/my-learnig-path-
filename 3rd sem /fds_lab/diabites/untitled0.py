import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn import metrics
import warnings
warnings.filterwarnings('ignore')
df=pd.read_csv("/home/darkemperor/aathi/my-learnig-path-/fds_lab/diabites/diabetes.csv")
#to print the data set 
#print(df)
X=df.drop("Outcome",axis=1)
Y=df[["Outcome"]]
X_train,X_test,y_train,y_test=train_test_split(X,Y,test_size=0.25,random_state=0)

model=LogisticRegression()
model.fit(X_train, y_train)
y_pred= model.predict(X_test)
#print("Accuracy for test set is {}.".format(round(metrics.accuracy_score(y_test,y_pred),4)))
#print("Precision for test set is {}.".format(round(metrics.precision_score(y_test,y_pred),4)))
#print("Recall for test set is {}.".format(round(metrics.recall_score(y_test,y_pred),4)))
f,ax=plt.subplots(figsize=(8,6))
sns.heatmap(df.corr(),cmap="GnBu",annot=True,linewidths=0.5,fmt='.1f',ax=ax)
plt.show()