import pandas as pd 
data= pd.read_csv("/home/darkemperor/aathi/my-learnig-path-/fds_lab/Iris/Iris.csv")
#print(data)
#print(data.dtypes)

#for printing the top5 dats in a rows
#print(data.head())

#for printing the rows randomly 
#print(data.sample(10))


#displaying the number ofnumber of the column and the name of the column 
#print(data.columns)
print(data.shape)

#printiing the whole dataset
#print(data)

#printing a slicing of rows 
print(data[10:20])

#import seaborn as sns
#sns.scatterplot(x=data.index,y=data['SepalWidthCm'],hue=data['Species'])