#Data Preprocessing

#Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York','Florida','California'),
                         labels = c(1,2,3))

#Splitting the dataset into Training and Test Sets
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Multiple Linear Regression
regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set)

#Predicting test set results
y_pred = predict(regressor, newdata = test_set)

#Visualization Training set
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$R.D.Spend, y = training_set$Profit), colour = 'red')+
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)), colour = 'blue')+
  ggtitle('R.D.Spend vs Profit (Training Set)')+
  xlab('R.D.Spend')+
  ylab('Profit')

#Visualization Test set
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = test_set$R.D.Spend, y = test_set$Profit), colour = 'red')+
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)), colour = 'blue')+
  ggtitle('R.D.Spend vs Profit (Test Set)')+
  xlab('R.D.Spend')+
  ylab('Profit')    
