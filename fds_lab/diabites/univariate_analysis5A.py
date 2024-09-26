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
'''import numpy as np
preg_proportion=np.array(df['Pregnancies'].value_counts())
preg_month=np.array(df['Pregnancies'].value_counts().index)
preg_proportion_perc=np.array(np.round(preg_proportion/sum(preg_proportion),3)*100,dtype=int)
preg=pd.DataFrame({'month':preg_month,'count_of_preg_prop':preg_proportion,'percentage_proportion':preg_proportion_perc})
preg.set_index(['month'],inplace=True)
print(preg.head(10))

#to plot the histogram
import matplotlib.pyplot as plt
df.hist(column='BloodPressure',grid=False,edgecolor='black')
array([[AxesSubplot,title,{'center':'BloodPressure'}]], dtype=object)
'''
#to plot the line curve

import seaborn as sns
sns.kdeplot(df['BloodPressure'])

#to plot the scatter plot 
import seaborn as sns
sns.scatterplot(x=df.index,y=df['Age'],hue=df['Outcome'])




# to analysis the diabeteis data set 

import matplotlib.pyplot as plt
import seaborn as sns

# Assuming df is your DataFrame
fig, axes = plt.subplots(nrows=3, ncols=2, dpi=120, figsize=(8, 6))

# First plot - Count plot of Pregnancies
plot00 = sns.countplot('Pregnancies', data=df, ax=axes[0][0], color='green')
axes[0][0].set_title('Count', fontdict={'fontsize': 8})
axes[0][0].set_xlabel('Month of Preg.', fontdict={'fontsize': 7})
axes[0][0].set_ylabel('Count', fontdict={'fontsize': 7})

# Second plot - Count plot with Outcome
plot01 = sns.countplot('Pregnancies', data=df, hue='Outcome', ax=axes[0][1])
axes[0][1].set_title('Diab. VS Non-Diab.', fontdict={'fontsize': 8})
axes[0][1].set_xlabel('Month of Preg.', fontdict={'fontsize': 7})
axes[0][1].set_ylabel('Count', fontdict={'fontsize': 7})
plot01.axes.legend(loc=1)

plt.setp(axes[0][1].get_legend().get_texts(), fontsize='6')
plt.setp(axes[0][1].get_legend().get_title(), fontsize='6')

# Third plot - Distribution of Pregnancies
plot10 = sns.histplot(df['Pregnancies'], ax=axes[1][0], kde=True)
axes[1][0].set_title('Pregnancies Distribution', fontdict={'fontsize': 8})
axes[1][0].set_xlabel('Pregnancy Class', fontdict={'fontsize': 7})
axes[1][0].set_ylabel('Freq/Dist', fontdict={'fontsize': 7})

# Fourth plot - Histogram for Diabetic vs Non-Diabetic Pregnancies
plot11 = df[df['Outcome'] == False]['Pregnancies'].plot.hist(ax=axes[1][1], label='Non-Diab.', alpha=0.5)
plot11_2 = df[df['Outcome'] == True]['Pregnancies'].plot.hist(ax=axes[1][1], label='Diab.', alpha=0.5)
axes[1][1].set_title('Diab. VS Non-Diab.', fontdict={'fontsize': 8})
axes[1][1].set_xlabel('Pregnancy Class', fontdict={'fontsize': 7})
axes[1][1].set_ylabel('Freq/Dist', fontdict={'fontsize': 7})
axes[1][1].legend(loc=1)

plt.setp(axes[1][1].get_legend().get_texts(), fontsize='6')
plt.setp(axes[1][1].get_legend().get_title(), fontsize='6')

# Fifth plot - Boxplot of Pregnancies
plot20 = sns.boxplot(x=df['Pregnancies'], ax=axes[2][0], orient='h')
axes[2][0].set_title('Pregnancies', fontdict={'fontsize': 8})
axes[2][0].set_xlabel('Pregnancy', fontdict={'fontsize': 7})
axes[2][0].set_ylabel('Five Point Summary', fontdict={'fontsize': 7})

# Sixth plot - Boxplot of Outcome vs Pregnancies
plot21 = sns.boxplot(x='Outcome', y='Pregnancies', data=df, ax=axes[2][1])
axes[2][1].set_title('Diab. VS Non-Diab.', fontdict={'fontsize': 8})
axes[2][1].set_xlabel('Pregnancy', fontdict={'fontsize': 7})
axes[2][1].set_ylabel('Five Point Summary', fontdict={'fontsize': 7})
plt.xticks(ticks=[0, 1], labels=['Non-Diab.', 'Diab.'], fontsize=7)


# Adjust layout
plt.tight_layout()


# Show the plots
plt.show()
