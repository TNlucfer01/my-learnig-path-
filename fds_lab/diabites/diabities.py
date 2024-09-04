import pandas as pd
df=pd.read_csv("/home/darkemperor/aathi/my-learnig-path-/fds_lab/diabites/diabetes.csv")
#print(df)
#to display the data types 
#p#rint(df.dtypes)

#to print first five rows 

#print(df.head())

#to get the shape
#print(df.shape)

#to calcilate mean

'''print("Mean of Pregnancies:%f" %df ['Pregnancies'].mean())
print("Mean of Blood Pressure:%f" %df ['BloodPressure'].mean())
print("Mean of Glucose:%f" %df ['Glucose'].mean())
print("Mean of Age:%f" %df ['Age'].mean())
'''

#calculate median 
'''print("Median of Pregnancies:%f" %df ['Pregnancies'].median())
print("Median of Blood Pressure:%f" %df ['BloodPressure'].median())
print("Median of Glucose:%f" %df ['Glucose'].median())
print("Median of Age:%f" %df ['Age'].median())
#to calcalete the standard deviation 
print("Standard Deviation for Pregnancies:%f" %df ['Pregnancies'].std())
print("Standard Deviation for Blood Pressure:%f" %df ['BloodPressure'].std())
print("Standard Deviation for Glucose:%f" %df ['Glucose'].std())
print("Standard Deviation for Age:%f" %df ['Age'].std())

#skewness of the data

print("Skewness of Pregnancies:%f" %df ['Pregnancies'].skew())
print("Skewness of Blood Pressure:%f" %df ['BloodPressure'].skew())
print("Skewness of Glucose:%f" %df ['Glucose'].skew())
print("Skewness of Age:%f" %df ['Age'].skew())

#kurtusis of the data 
print("Kurtosis of Pregnancies:%f" %df ['Pregnancies'].kurt())
print("Kurtosis of Blood Pressure:%f" %df ['BloodPressure'].kurt())
print("Kurtosis of Glucose:%f" %df ['Glucose'].kurt())
print("Kurtosis of Age:%f" %df ['Age'].kurt())

'''

#print(df.Glucose.describe())
#calculate the frequency table 
#print(df['Pregnancies'].value_counts())
#calculate the fequence count for the outcome 


#print(pd.crosstab(index=df['Outcome'],columns='count'))
#print(pd.crosstab(index=df['Pregnancies'],columns='count'))


#to calculate the pregnacy propotion and its percentage 
import numpy as np
preg_proportion=np.array(df['Pregnancies'].value_counts())
preg_month=np.array(df['Pregnancies'].value_counts().index)
preg_proportion_perc=np.array(np.round(preg_proportion/sum(preg_proportion),3)*100,dtype=int)
preg=pd.DataFrame({'month':preg_month,'count_of_preg_prop':preg_proportion,'percentage_proportion':preg_proportion_perc})
preg.set_index(['month'],inplace=True)
print(preg.head(10))

#to calculate the 