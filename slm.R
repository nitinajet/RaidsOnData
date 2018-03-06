#Data Preprocessing

#Importing the dataset
dataset = read.csv('Salary_Data.csv')




#Splitting the dataset into Training and Test Sets
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.7)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Simple Linear Regression
regressor = lm(formula = Salary~.,
               data = training_set)

#Predicting test set results
y_pred = predict(regressor,type ='response',  newdata = test_set)

#Visualization Training set
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red')+
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue')+
  ggtitle('Salary vs Years of Experience (Training Set)')+
  xlab('Years of Experience')+
  ylab('Salary')
           
#Visualization Test set
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), colour = 'red')+
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue')+
  ggtitle('Salary vs Years of Experience (Test Set)')+
  xlab('Years of Experience')+
  ylab('Salary')    